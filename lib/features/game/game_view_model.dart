import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:swipecolor/features/game/models/level_model.dart';
import 'package:swipecolor/core/services/storage_service.dart';

class GameViewModel extends ChangeNotifier {
  final LevelModel level;

  List<Offset> _currentPath = [];
  List<Offset> get currentPath => _currentPath;

  Set<int> _connectedDotIds = {};
  Set<int> get connectedDotIds => _connectedDotIds;

  bool _isGameOver = false;
  bool get isGameOver => _isGameOver;

  bool _isWin = false;
  bool get isWin => _isWin;

  int _nextOrderToConnect = 1;

  GameViewModel({required this.level});

  void onDragStart(Offset position, Size size) {
    if (_isGameOver) return;
    _resetGame();
    _checkCollision(position, size);
    _currentPath.add(position);
    notifyListeners();
  }

  void onDragUpdate(Offset position, Size size) {
    if (_isGameOver) return;
    _currentPath.add(position);
    _checkCollision(position, size);
    notifyListeners();
  }

  void onDragEnd() {
    if (_isGameOver) return;

    if (_connectedDotIds.length == level.dots.length) {
      _win();
    } else {
      _fail();
    }
    notifyListeners();
  }

  void _checkCollision(Offset position, Size size) {
    for (var dot in level.dots) {
      if (_connectedDotIds.contains(dot.id)) continue;

      // Convert percentage to pixels
      final dotX = dot.x * size.width;
      final dotY = dot.y * size.height;
      final dotPos = Offset(dotX, dotY);

      final distance = (position - dotPos).distance;
      if (distance < dot.radius + 10) {
        // Slight magnetic snap/buffer
        if (dot.order == _nextOrderToConnect) {
          _connectedDotIds.add(dot.id);
          _nextOrderToConnect++;
          _vibrate(intensity: 50);
        } else if (dot.order > _nextOrderToConnect) {
          // Touched wrong dot ahead of time
          _fail();
        }
      }
    }
  }

  void _resetGame() {
    _currentPath = [];
    _connectedDotIds = {};
    _nextOrderToConnect = 1;
    _isGameOver = false;
    _isWin = false;
  }

  void _win() async {
    _isGameOver = true;
    _isWin = true;
    _vibrate(intensity: 100);

    // Save progress
    await StorageService.setStarsForLevel(level.id, 3); // For now just 3 stars
    final currentUnlocked = StorageService.getUnlockedLevel();
    if (level.id == currentUnlocked) {
      await StorageService.setUnlockedLevel(level.id + 1);
    }
  }

  void _fail() {
    _isGameOver = true;
    _isWin = false;
    _vibrate(intensity: 200);
  }

  void _vibrate({int intensity = 50}) async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: intensity);
    }
  }

  void restart() {
    _resetGame();
    notifyListeners();
  }
}

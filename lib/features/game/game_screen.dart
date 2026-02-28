import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipecolor/features/game/game_view_model.dart';
import 'package:swipecolor/features/game/models/level_model.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GameScreen extends StatelessWidget {
  final LevelModel level;

  const GameScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameViewModel(level: level),
      child: Scaffold(
        body: Stack(
          children: [
            const _GameBoard(),
            _buildOverlay(context),
            _buildAppBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            'Level ${level.id}',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<GameViewModel>().restart(),
          ),
        ],
      ),
    );
  }

  Widget _buildOverlay(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, vm, child) {
        if (!vm.isGameOver) return const SizedBox.shrink();

        return Container(
          color: Colors.black.withOpacity(0.4),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    vm.isWin ? 'PERFECT!' : 'FAILED',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: vm.isWin
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.filled(
                        onPressed: () => vm.restart(),
                        icon: const Icon(Icons.refresh),
                        padding: const EdgeInsets.all(16),
                      ),
                      const SizedBox(width: 20),
                      if (vm.isWin)
                        IconButton.filled(
                          onPressed: () => Navigator.pop(context, true),
                          icon: const Icon(Icons.arrow_forward),
                          padding: const EdgeInsets.all(16),
                        ),
                    ],
                  ),
                ],
              ).animate().scale(curve: Curves.elasticOut, duration: 600.ms),
            ),
          ),
        );
      },
    );
  }
}

class _GameBoard extends StatelessWidget {
  const _GameBoard();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<GameViewModel>();
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onPanStart: (details) =>
          vm.onDragStart(details.localPosition, MediaQuery.of(context).size),
      onPanUpdate: (details) =>
          vm.onDragUpdate(details.localPosition, MediaQuery.of(context).size),
      onPanEnd: (_) => vm.onDragEnd(),
      child: Consumer<GameViewModel>(
        builder: (context, vm, child) {
          return CustomPaint(
            painter: _GamePainter(
              dots: vm.level.dots,
              path: vm.currentPath,
              connectedIds: vm.connectedDotIds,
              colorScheme: colorScheme,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _GamePainter extends CustomPainter {
  final List<DotModel> dots;
  final List<Offset> path;
  final Set<int> connectedIds;
  final ColorScheme colorScheme;

  _GamePainter({
    required this.dots,
    required this.path,
    required this.connectedIds,
    required this.colorScheme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = colorScheme.primary.withOpacity(0.6)
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw path
    if (path.length > 1) {
      final p = Path();
      p.moveTo(path.first.dx, path.first.dy);
      for (var i = 1; i < path.length; i++) {
        p.lineTo(path[i].dx, path[i].dy);
      }
      canvas.drawPath(p, paintLine);
    }

    // Draw dots
    for (var dot in dots) {
      final isConnected = connectedIds.contains(dot.id);
      final dotPos = Offset(dot.x * size.width, dot.y * size.height);

      // Shadow/Glow
      if (isConnected) {
        canvas.drawCircle(
          dotPos,
          dot.radius + 5,
          Paint()..color = colorScheme.secondary.withOpacity(0.3),
        );
      }

      final dotPaint = Paint()
        ..color = isConnected
            ? colorScheme.secondary
            : colorScheme.outline.withOpacity(0.5);

      canvas.drawCircle(dotPos, dot.radius, dotPaint);

      // Inner dot
      canvas.drawCircle(
        dotPos,
        dot.radius * 0.4,
        Paint()..color = Colors.white.withOpacity(0.8),
      );

      // Draw order number
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${dot.order}',
          style: TextStyle(
            color: isConnected ? Colors.white : colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: dot.radius,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        dotPos - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GamePainter oldDelegate) => true;
}

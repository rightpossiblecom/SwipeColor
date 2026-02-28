import 'dart:convert';
import 'package:flutter/material.dart';

class DotModel {
  final int id;
  // Use percentage (0.0 to 1.0) for layout
  final double x;
  final double y;
  final int order;
  final double radius;
  final Color? color;

  DotModel({
    required this.id,
    required this.x,
    required this.y,
    required this.order,
    this.radius = 20.0,
    this.color,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'x': x,
    'y': y,
    'order': order,
    'radius': radius,
    'colorValue': color?.value,
  };

  factory DotModel.fromJson(Map<String, dynamic> json) => DotModel(
    id: json['id'],
    x: json['x'].toDouble(),
    y: json['y'].toDouble(),
    order: json['order'],
    radius: json['radius']?.toDouble() ?? 20.0,
    color: json['colorValue'] != null ? Color(json['colorValue']) : null,
  );
}

class LevelModel {
  final int id;
  final String title;
  final List<DotModel> dots;
  final int difficulty; // 1-3

  LevelModel({
    required this.id,
    required this.title,
    required this.dots,
    required this.difficulty,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'dots': dots.map((d) => d.toJson()).toList(),
    'difficulty': difficulty,
  };

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
    id: json['id'],
    title: json['title'],
    dots: (json['dots'] as List).map((d) => DotModel.fromJson(d)).toList(),
    difficulty: json['difficulty'],
  );
}

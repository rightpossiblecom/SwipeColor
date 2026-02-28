import 'package:swipecolor/features/game/models/level_model.dart';

class LevelsData {
  static final List<LevelModel> levels = [
    LevelModel(
      id: 1,
      title: "The Start",
      difficulty: 1,
      dots: [
        DotModel(id: 1, x: 0.5, y: 0.3, order: 1),
        DotModel(id: 2, x: 0.2, y: 0.7, order: 2),
        DotModel(id: 3, x: 0.8, y: 0.7, order: 3),
      ],
    ),
    LevelModel(
      id: 2,
      title: "Simple Square",
      difficulty: 1,
      dots: [
        DotModel(id: 1, x: 0.2, y: 0.3, order: 1),
        DotModel(id: 2, x: 0.8, y: 0.3, order: 2),
        DotModel(id: 3, x: 0.8, y: 0.7, order: 3),
        DotModel(id: 4, x: 0.2, y: 0.7, order: 4),
      ],
    ),
    LevelModel(
      id: 3,
      title: "Zig Zag",
      difficulty: 1,
      dots: [
        DotModel(id: 1, x: 0.1, y: 0.2, order: 1),
        DotModel(id: 2, x: 0.9, y: 0.4, order: 2),
        DotModel(id: 3, x: 0.1, y: 0.6, order: 3),
        DotModel(id: 4, x: 0.9, y: 0.8, order: 4),
      ],
    ),
    LevelModel(
      id: 4,
      title: "Crossed paths",
      difficulty: 2,
      dots: [
        DotModel(id: 1, x: 0.5, y: 0.1, order: 1),
        DotModel(id: 2, x: 0.5, y: 0.9, order: 2),
        DotModel(id: 3, x: 0.9, y: 0.5, order: 3),
        DotModel(id: 4, x: 0.1, y: 0.5, order: 4),
        DotModel(id: 5, x: 0.5, y: 0.1, order: 5), // Loop back
      ],
    ),
    LevelModel(
      id: 5,
      title: "Infinity",
      difficulty: 2,
      dots: [
        DotModel(id: 1, x: 0.5, y: 0.5, order: 1),
        DotModel(id: 2, x: 0.2, y: 0.2, order: 2),
        DotModel(id: 3, x: 0.2, y: 0.8, order: 3),
        DotModel(id: 4, x: 0.5, y: 0.5, order: 4),
        DotModel(id: 5, x: 0.8, y: 0.8, order: 5),
        DotModel(id: 6, x: 0.8, y: 0.2, order: 6),
        DotModel(id: 7, x: 0.5, y: 0.5, order: 7),
      ],
    ),
    LevelModel(
      id: 6,
      title: "Star",
      difficulty: 2,
      dots: [
        DotModel(id: 1, x: 0.5, y: 0.1, order: 1),
        DotModel(id: 2, x: 0.2, y: 0.9, order: 2),
        DotModel(id: 3, x: 0.9, y: 0.4, order: 3),
        DotModel(id: 4, x: 0.1, y: 0.4, order: 4),
        DotModel(id: 5, x: 0.8, y: 0.9, order: 5),
        DotModel(id: 6, x: 0.5, y: 0.1, order: 6),
      ],
    ),
    LevelModel(
      id: 7,
      title: "The M",
      difficulty: 1,
      dots: [
        DotModel(id: 1, x: 0.1, y: 0.8, order: 1),
        DotModel(id: 2, x: 0.1, y: 0.2, order: 2),
        DotModel(id: 3, x: 0.5, y: 0.5, order: 3),
        DotModel(id: 4, x: 0.9, y: 0.2, order: 4),
        DotModel(id: 5, x: 0.9, y: 0.8, order: 5),
      ],
    ),
    LevelModel(
      id: 8,
      title: "Warp Point",
      difficulty: 3,
      dots: [
        DotModel(id: 1, x: 0.3, y: 0.5, order: 1),
        DotModel(id: 2, x: 0.1, y: 0.1, order: 2),
        DotModel(id: 3, x: 0.9, y: 0.1, order: 3),
        DotModel(id: 4, x: 0.7, y: 0.5, order: 4),
        DotModel(id: 5, x: 0.9, y: 0.9, order: 5),
        DotModel(id: 6, x: 0.1, y: 0.9, order: 6),
        DotModel(id: 7, x: 0.3, y: 0.5, order: 7),
      ],
    ),
    LevelModel(
      id: 9,
      title: "Diamond",
      difficulty: 2,
      dots: [
        DotModel(id: 1, x: 0.5, y: 0.1, order: 1),
        DotModel(id: 2, x: 0.9, y: 0.5, order: 2),
        DotModel(id: 3, x: 0.5, y: 0.9, order: 3),
        DotModel(id: 4, x: 0.1, y: 0.5, order: 4),
        DotModel(id: 5, x: 0.5, y: 0.1, order: 5),
      ],
    ),
    LevelModel(
      id: 10,
      title: "Target",
      difficulty: 3,
      dots: [
        DotModel(id: 1, x: 0.5, y: 0.5, order: 1),
        DotModel(id: 2, x: 0.5, y: 0.2, order: 2),
        DotModel(id: 3, x: 0.8, y: 0.5, order: 3),
        DotModel(id: 4, x: 0.5, y: 0.8, order: 4),
        DotModel(id: 5, x: 0.2, y: 0.5, order: 5),
        DotModel(id: 6, x: 0.5, y: 0.2, order: 6),
      ],
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:swipecolor/core/constants/levels_data.dart';
import 'package:swipecolor/core/services/storage_service.dart';
import 'package:swipecolor/features/game/game_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LevelSelectScreen extends StatefulWidget {
  const LevelSelectScreen({super.key});

  @override
  State<LevelSelectScreen> createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends State<LevelSelectScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final unlockedLevel = StorageService.getUnlockedLevel();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Levels',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: LevelsData.levels.length,
        itemBuilder: (context, index) {
          final level = LevelsData.levels[index];
          final isLocked = level.id > unlockedLevel;
          final stars = StorageService.getStarsForLevel(level.id);

          return _LevelCard(
            levelId: level.id,
            isLocked: isLocked,
            stars: stars,
            onTap: () async {
              if (!isLocked) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => GameScreen(level: level)),
                );
                setState(() {}); // Refresh star counts on return
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Complete previous levels to unlock!'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: colorScheme.error,
                  ),
                );
              }
            },
          ).animate().fadeIn(delay: (index * 50).ms).scale();
        },
      ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  final int levelId;
  final bool isLocked;
  final int stars;
  final VoidCallback onTap;

  const _LevelCard({
    required this.levelId,
    required this.isLocked,
    required this.stars,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: isLocked
                ? colorScheme.outline.withOpacity(0.1)
                : colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isLocked
                  ? Colors.transparent
                  : colorScheme.primary.withOpacity(0.2),
            ),
            boxShadow: isLocked
                ? null
                : [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLocked)
                Icon(Icons.lock_rounded, color: colorScheme.outline, size: 32)
              else ...[
                Text(
                  '$levelId',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Icon(
                      Icons.star_rounded,
                      size: 16,
                      color: index < stars
                          ? Colors.amber
                          : colorScheme.outline.withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

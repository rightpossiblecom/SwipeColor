import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipecolor/core/theme/app_theme.dart';
import 'package:swipecolor/core/services/storage_service.dart';
import 'package:swipecolor/features/home/home_screen.dart';
import 'package:swipecolor/features/settings/settings_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage
  await StorageService.init();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SettingsViewModel())],
      child: const SwipeColorApp(),
    ),
  );
}

class SwipeColorApp extends StatelessWidget {
  const SwipeColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsViewModel>(
      builder: (context, settings, child) {
        return MaterialApp(
          title: 'SwipeColor',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settings.isDark ? ThemeMode.dark : ThemeMode.light,
          home: const HomeScreen(),
        );
      },
    );
  }
}

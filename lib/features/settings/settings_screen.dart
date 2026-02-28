import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:swipecolor/features/settings/settings_view_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Consumer<SettingsViewModel>(
          builder: (context, vm, child) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _Section(
                  title: 'Appearance',
                  children: [
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      subtitle: const Text('Easier on the eyes'),
                      value: vm.isDark,
                      onChanged: (val) {
                        vm.toggleTheme(val);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Theme updated! Restart to see full effect.',
                            ),
                          ),
                        );
                      },
                      secondary: const Icon(Icons.dark_mode_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _Section(
                  title: 'Data & Privacy',
                  children: [
                    ListTile(
                      title: const Text('Clear Progress'),
                      subtitle: const Text('Reset all levels and stars'),
                      trailing: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      ),
                      onTap: () => _showClearConfirmation(context, vm),
                    ),
                    ListTile(
                      title: const Text('Privacy Policy'),
                      trailing: const Icon(Icons.open_in_new_rounded, size: 20),
                      onTap: () => _launchUrl(
                        'https://example.com/privacy',
                      ), // Placeholder
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _Section(
                  title: 'Support',
                  children: [
                    ListTile(
                      title: const Text('Rate App'),
                      trailing: const Icon(Icons.star_outline_rounded),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Feedback'),
                      trailing: const Icon(Icons.mail_outline_rounded),
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showClearConfirmation(BuildContext context, SettingsViewModel vm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Progress?'),
        content: const Text(
          'This will reset all your unlocked levels and star ratings. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () async {
              await vm.clearProgress();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Progress cleared!')),
              );
            },
            child: const Text(
              'CLEAR ALL',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Card(child: Column(children: children)),
      ],
    );
  }
}

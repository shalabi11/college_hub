import 'package:college_hub/model/theme.dart';
import 'package:flutter/material.dart';

class IconThemeApp extends StatelessWidget {
  const IconThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        themeNotifier.value == ThemeMode.dark
            ? Icons.wb_sunny
            : Icons.nightlight_round,
      ),
      onPressed: () async {
        toggleTheme();
      },
    );
  }
}

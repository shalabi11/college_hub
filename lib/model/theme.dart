import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

// void toggleTheme() async {
//   isDarkMode = !isDarkMode;
//   notifyListeners();
//   var box = await Hive.openBox('college');
//   box.put('isDarkMode', isDarkMode);
// }

Future<void> toggleTheme() async {
  if (themeNotifier.value == ThemeMode.dark) {
    themeNotifier.value = ThemeMode.light;
    await Hive.box('college').put('isDarkMode', false);
  } else {
    themeNotifier.value = ThemeMode.dark;
    await Hive.box('college').put('isDarkMode', true);
  }
}

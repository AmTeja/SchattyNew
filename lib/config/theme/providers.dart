import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schatty/core/shared_preferences/keys.dart';
import 'package:schatty/core/shared_preferences/schatty_sp.dart';

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode?>((_) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeMode?> {
  ThemeNotifier() : super(ThemeMode.system) {
    loadTheme();
  }

  ThemeMode? get value => state;
  final SchattySP _sharedPreferences = SchattySP();

  void toggle() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _sharedPreferences.setBool(SPKeys.isDarkMode, state == ThemeMode.dark);
  }

  Future<void> loadTheme() async {
    final bool? isDarkMode =
        await _sharedPreferences.getBool(SPKeys.isDarkMode);
    if (isDarkMode != null) {
      state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
  }
}

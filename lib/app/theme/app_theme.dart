import 'package:flutter/material.dart';

ThemeData buildBabyLiaTheme() {
  const cream = Color(0xFFFFF7EF);
  const peach = Color(0xFFFFD7BF);
  const rose = Color(0xFFFFB8C8);
  const sky = Color(0xFFB7E3FF);
  const mint = Color(0xFFC8F0D8);
  const ink = Color(0xFF334155);

  final base = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: peach,
      primary: peach,
      secondary: mint,
      surface: cream,
    ),
    scaffoldBackgroundColor: cream,
  );

  return base.copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: cream,
      foregroundColor: ink,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: base.textTheme.apply(
      bodyColor: ink,
      displayColor: ink,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0xFFF1E3D7)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: sky,
        foregroundColor: ink,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    chipTheme: base.chipTheme.copyWith(
      backgroundColor: mint,
      selectedColor: rose,
      labelStyle: const TextStyle(fontWeight: FontWeight.w700),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
  );
}

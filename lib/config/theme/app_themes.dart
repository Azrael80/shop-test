import 'package:flutter/material.dart';

ThemeData theme(ThemeData base) {
  return base.copyWith(
    textTheme: base.textTheme.copyWith(
      displayLarge: const TextStyle(
        color: Color(0xFF393D3F),
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: base.colorScheme.copyWith(
      secondary: const Color(0xFFC6C5B9),
    ),
  );
}

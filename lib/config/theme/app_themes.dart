import 'package:flutter/material.dart';

ThemeData theme(ThemeData base) {
  return base.copyWith(
    textTheme: base.textTheme.copyWith(
      displayLarge: const TextStyle(
        color: Color(0xFF2E4057),
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: base.colorScheme.copyWith(
      secondary: const Color(0xFFC6C5B9),
      background: const Color.fromARGB(255, 224, 224, 224),
    ),
  );
}

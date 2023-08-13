import 'package:flutter/material.dart';
import 'package:shop_test/presentation/layouts/home_layout.dart';
import 'package:shop_test/repository/product_repository.dart';
import 'package:shop_test/routing/app_router.dart';

void main() {
  ProductRepository().getAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xff546A7B),
    );

    return MaterialApp(
      title: 'eShop',
      theme: theme.copyWith(
        textTheme: theme.textTheme.copyWith(
          displayLarge: const TextStyle(
            color: Color(0xFF393D3F),
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: theme.colorScheme.copyWith(
          secondary: const Color(0xFFC6C5B9),
        ),
      ),
      home: HomeLayout(),
    );
  }
}

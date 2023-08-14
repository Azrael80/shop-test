import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_test/config/theme/app_themes.dart';
import 'package:shop_test/features/home/presentation/pages/home_page.dart';

void main() {
  HttpOverrides.global = HttpInterceptor();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eShop',
      debugShowCheckedModeBanner: false,
      theme: theme(
        ThemeData(
          useMaterial3: true,
          primaryColor: const Color(0xff546A7B),
        ),
      ),
      home: const HomePage(),
    );
  }
}

/// Classe temporaire permettant d'ignorer les mauvais certificats.
class HttpInterceptor extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // On ignore les mauvais certificats (il s'agit d'un appli de test
    // ils ne sont pas utiles).
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

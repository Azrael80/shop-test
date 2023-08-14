import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/config/theme/app_themes.dart';
import 'package:shop_test/core/util/bloc_observer/app_bloc_observer.dart';
import 'package:shop_test/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:shop_test/features/home/presentation/pages/home_page.dart';

void main() {
  HttpOverrides.global = HttpInterceptor();
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (ctx) => CartBloc(),
      lazy: false,
      child: MaterialApp(
        title: 'eShop',
        debugShowCheckedModeBanner: false,
        theme: theme(
          ThemeData(
            useMaterial3: true,
            primaryColor: const Color(0xff546A7B),
          ),
        ),
        home: const HomePage(),
      ),
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

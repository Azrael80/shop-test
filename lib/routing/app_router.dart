// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:shop_test/presentation/product/product_screen.dart';
import 'package:shop_test/presentation/product_list/product_list_screen.dart';

class AppRouter {
  static const String PRODUCT_LIST = '/home';
  static const String PRODUCT = '/product';

  /// Clé permettant d'accéder au navigateur.
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Map<
      String,
      Widget Function(
        BuildContext context,
      )> get routes => {
        AppRouter.PRODUCT_LIST: (ctx) => ProductListScreen(),
        AppRouter.PRODUCT: (ctx) => ProductScreen(),
      };

  /// Permet d'accéder au navigateur présent dans la vue.
  static NavigatorState getNestedNavigator() {
    return Navigator.of(navigatorKey.currentContext!);
  }
}

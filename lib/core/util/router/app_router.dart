import 'package:flutter/material.dart';
import 'package:shop_test/core/util/router/custom_navigation_observer.dart';

class AppRouter {
  /// Clé permettant d'accéder au navigateur interne.
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// Observer permettant l'écoute du navigateur interne.
  static final CustomNavigatorObserver observer = CustomNavigatorObserver();

  /// Permet d'accéder au navigateur présent dans la vue.
  static NavigatorState getNestedNavigator() {
    return Navigator.of(navigatorKey.currentContext!);
  }
}

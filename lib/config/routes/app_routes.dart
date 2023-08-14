import 'package:flutter/material.dart';
import 'package:shop_test/features/products/presentation/pages/product/product_screen.dart';
import 'package:shop_test/features/products/presentation/pages/list/product_list_screen.dart';
import 'package:shop_test/core/util/router/app_router.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.PRODUCT_LIST:
        return _generateRoute(ProductListScreen());

      case AppRouter.PRODUCT:
        return _generateRoute(ProductScreen());

      default:
        return _generateRoute(ProductListScreen());
    }
  }

  /// Génération de la route avec une animation.
  static Route<dynamic> _generateRoute(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (context, _, __) => view,
      transitionsBuilder: (_, a, __, c) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(a),
        child: c,
      ),
    );
  }
}

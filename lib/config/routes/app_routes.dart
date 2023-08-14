// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:shop_test/common/util/search.dart';
import 'package:shop_test/features/products/presentation/pages/product/product_screen.dart';
import 'package:shop_test/features/products/presentation/pages/list/product_list_screen.dart';

class AppRoutes {
  static const String PRODUCT_LIST = 'products';
  static const String PRODUCT = 'product';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.PRODUCT_LIST:
        return _generateRoute(
          ProductListScreen(
            searchController: Search.searchController,
          ),
        );

      case AppRoutes.PRODUCT:
        return _generateRoute(ProductScreen());

      default:
        return _generateRoute(
          ProductListScreen(
            searchController: Search.searchController,
          ),
        );
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

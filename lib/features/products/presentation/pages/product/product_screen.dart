import 'package:flutter/material.dart';
import 'package:shop_test/config/routes/app_routes.dart';
import 'package:shop_test/core/util/router/app_router.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('text 2'),
            TextButton(
              onPressed: () =>
                  AppRouter.getNestedNavigator().pushNamed(AppRoutes.PRODUCT),
              child: Text('page +'),
            )
          ],
        ));
  }
}

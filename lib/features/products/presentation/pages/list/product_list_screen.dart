import 'package:flutter/material.dart';
import 'package:shop_test/core/util/router/app_router.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('text 1'),
        TextButton(
          onPressed: () =>
              AppRouter.getNestedNavigator().pushNamed(AppRouter.PRODUCT),
          child: Text('page 2'),
        )
      ],
    );
  }
}

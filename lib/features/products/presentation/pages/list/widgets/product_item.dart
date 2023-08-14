import 'package:flutter/material.dart';
import 'package:shop_test/config/routes/app_routes.dart';
import 'package:shop_test/core/util/router/app_router.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppRouter.getNestedNavigator().pushNamed(
        AppRoutes.PRODUCT,
        arguments: product,
      ),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTumbnail(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 8,
                        fit: FlexFit.tight,
                        child: Text(
                          product.title ?? 'Iconnu',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.star, size: 15),
                            Text(
                              '${product.rating}',
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    '${product.price}€',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTumbnail() {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          child: Image.network(
            product.thumbnail ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

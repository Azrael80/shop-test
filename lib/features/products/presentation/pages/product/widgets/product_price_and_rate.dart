import 'package:flutter/material.dart';
import 'package:shop_test/common/widgets/product_rate/product_rate.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';

class ProductPriceAndRate extends StatelessWidget {
  final ProductEntity product;

  const ProductPriceAndRate({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            '${(product.price ?? 0).toStringAsFixed(2)} €',
            style: const TextStyle(
              color: Color(0xFFF3752B),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        const Spacer(),
        ProductRate(
          rating: product.rating ?? 0,
          count: product.ratingCount ?? 0,
        ),
      ],
    );
  }
}

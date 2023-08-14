import 'dart:math';

import 'package:flutter/material.dart';
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
            '${product.price} €',
            style: const TextStyle(
              color: Color(0xFFF3752B),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: Icon(
            Icons.star,
            color: Colors.orange[400],
            size: 20,
          ),
        ),
        Text.rich(
          TextSpan(
            text: '${product.rating} ',
            children: [
              TextSpan(
                text: '(${Random().nextInt(2000) + 1})',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';
import 'package:shop_test/features/products/presentation/pages/product/widgets/product_add_cart_button.dart';
import 'package:shop_test/features/products/presentation/pages/product/widgets/product_images.dart';
import 'package:shop_test/features/products/presentation/pages/product/widgets/product_price_and_rate.dart';

class ProductScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F6F6),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImages(
                  imageUrls: product.images ?? [],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
                  child: ProductPriceAndRate(product: product),
                ),
                _buildTitle(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${product.description}'),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: ProductAddCartButton(product: product),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Text.rich(
          TextSpan(
            text: '${product.title}',
            children: [
              TextSpan(
                text: '\n${product.brand}',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

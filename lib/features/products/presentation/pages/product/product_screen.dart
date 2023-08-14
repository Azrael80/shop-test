import 'package:flutter/material.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';
import 'package:shop_test/features/products/presentation/pages/product/widgets/product_images.dart';

class ProductScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImages(
            imageUrls: product.images ?? [],
          ),
          _buildTitle(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(bottom: 2),
        child: Text(
          '${product.title}',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

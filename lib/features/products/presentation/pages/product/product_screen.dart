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
                  child: Text(
                    '${product.description}\n\n'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet sagittis lacus, in porta erat. Maecenas et ligula consectetur, suscipit arcu sed, consectetur enim. Mauris ac enim auctor, vulputate felis sit amet, fermentum ex. Aliquam rhoncus consequat ex. Nulla iaculis eget lectus sit amet fermentum. Aliquam et ultrices felis, vehicula tristique sapien. Maecenas sed tincidunt mauris. Sed ac leo odio. Nunc quis massa nec erat pellentesque convallis eget quis diam. Etiam blandit erat in consequat mollis. Nullam ac velit neque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus justo metus, auctor quis hendrerit nec, auctor in diam. Duis lacinia condimentum viverra. Sed maximus eu ex eu maximus. Phasellus et turpis eget est vestibulum vehicula at eu ante.'
                    '\nFusce et purus feugiat enim vehicula elementum et a lorem. Aliquam vitae luctus magna, auctor tempus ante. Phasellus in lorem id lacus tincidunt venenatis eget et felis. Nunc blandit, ipsum eu auctor tempor, quam mauris condimentum magna, sed placerat ex tellus consectetur tortor. Vestibulum quis dictum nisi, ut placerat nisi. Duis egestas metus dolor, et maximus ipsum varius non. Duis nibh lacus, egestas ut suscipit a, iaculis sit amet arcu. Etiam et magna turpis. Duis ut lectus consectetur, euismod arcu id, posuere purus. Nunc ac elit ornare, faucibus nunc sed, tristique metus.'
                    '\nSuspendisse tempus rhoncus dolor, a mollis dolor dignissim vel. Donec egestas imperdiet turpis nec pulvinar. Integer eget fermentum ipsum, et eleifend dolor. In aliquam sed leo quis rutrum. Nam posuere enim id hendrerit tempor. Aliquam facilisis enim vitae orci lobortis tincidunt. Sed sit amet purus tristique, posuere justo lacinia, commodo tortor. Maecenas egestas ultrices dignissim. ',
                  ),
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

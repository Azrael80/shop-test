import 'package:flutter/material.dart';
import 'package:shop_test/common/widgets/product_rate/product_rate.dart';
import 'package:shop_test/features/cart/data/cart_item.dart';
import 'package:shop_test/features/cart/presentation/pages/cart/widgets/cart_count_selector.dart';

class CartListItem extends StatelessWidget {
  final CartItem item;

  const CartListItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(bottom: 4.0),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network(item.product.thumbnail!, fit: BoxFit.cover),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 5.0,
                ),
                child: _buildInformations(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${item.product.title}',
          style: const TextStyle(fontSize: 17),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        ProductRate(
          rating: item.product.rating ?? 0,
          count: item.product.ratingCount ?? 0,
        ),
        const Spacer(),
        Row(
          children: [
            _buildPrice(),
            const Spacer(),
            CartQuantitySelector(item: item),
          ],
        )
      ],
    );
  }

  /// Permet d'afficher le prix.
  Widget _buildPrice() {
    // On découpe le prix en deux parties
    final List<String> price =
        (item.product.price ?? 0).toStringAsFixed(2).split('.');

    return Text.rich(
      TextSpan(
        text: price[0],
        children: [
          TextSpan(
            text: '.${price[1]}€',
            style: const TextStyle(fontSize: 13.5),
          ),
        ],
      ),
      style: const TextStyle(
        color: Color(0xFFF3752B),
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }
}

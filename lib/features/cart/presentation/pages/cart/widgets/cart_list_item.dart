import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/common/widgets/product_rate/product_rate.dart';
import 'package:shop_test/features/cart/data/cart_item.dart';
import 'package:shop_test/features/cart/presentation/bloc/cart/cart_bloc.dart';

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

class CartQuantitySelector extends StatelessWidget {
  final CartItem item;

  const CartQuantitySelector({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildRemoveButton(),
          Container(
            height: 18,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              '${item.count}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildAddButton(context),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required BoxBorder border,
    required void Function() onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 18,
          width: 18,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: border,
          ),
          child: Icon(
            icon,
            size: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildRemoveButton() {
    return _buildActionButton(
      onPressed: () {},
      border: Border(
        right: BorderSide(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      icon: Icons.remove,
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return _buildActionButton(
      onPressed: () =>
          context.read<CartBloc>().add(CartAddProduct(item.product)),
      border: Border(
        left: BorderSide(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      icon: Icons.add,
    );
  }
}

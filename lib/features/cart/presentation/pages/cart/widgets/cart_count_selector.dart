import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/features/cart/data/cart_item.dart';
import 'package:shop_test/features/cart/presentation/bloc/cart/cart_bloc.dart';

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
          _buildRemoveButton(context),
          _buildQuantity(),
          _buildAddButton(context),
        ],
      ),
    );
  }

  /// Affiche la quantité.
  Widget _buildQuantity() {
    return Container(
      height: 18,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        '${item.count}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
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
          // padding: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: border,
          ),
          child: Center(
            child: Icon(
              icon,
              size: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRemoveButton(BuildContext context) {
    return _buildActionButton(
      onPressed: () =>
          context.read<CartBloc>().add(CartRemoveProduct(item.product)),
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

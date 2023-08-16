import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/features/cart/presentation/bloc/cart/cart_bloc.dart';

class CartButton extends StatefulWidget {
  final Color? color;
  final void Function() onPressed;

  const CartButton({
    super.key,
    this.color,
    required this.onPressed,
  });

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  int productCount = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) => current is CartUpdated,
      builder: (context, state) {
        // Récupération du nombre total de produits dans le
        // panier.
        if (state is CartUpdated) {
          productCount = state.cart.totalProducts;
        }

        return IconButton(
          icon: Stack(
            children: [
              Icon(
                Icons.shopping_cart,
                color: widget.color,
                size: 30,
              ),
              if (productCount > 0) _buildCount()
            ],
          ),
          onPressed: widget.onPressed,
        );
      },
    );
  }

  /// Permet d'afficher le nombre d'éléments
  Widget _buildCount() {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(
            width: 0.5,
            color: Colors.white.withOpacity(0.7),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1.0,
            ),
          ],
        ),
        constraints: const BoxConstraints(
          minWidth: 14,
          minHeight: 14,
        ),
        child: Text(
          '$productCount',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 8,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

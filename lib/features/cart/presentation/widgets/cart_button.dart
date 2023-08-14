import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/features/cart/presentation/bloc/cart/cart_bloc.dart';

class CartButton extends StatefulWidget {
  final Color? color;

  const CartButton({
    super.key,
    this.color,
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

        return Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: widget.color,
                size: 30,
              ),
              onPressed: () {},
            ),
            if (productCount > 0)
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
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
              )
          ],
        );
      },
    );
  }
}

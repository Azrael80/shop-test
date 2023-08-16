import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_test/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';

class ProductAddCartButton extends StatelessWidget {
  final ProductEntity product;

  const ProductAddCartButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _onAddCart(context),
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFF71A2B6),
        foregroundColor: Colors.white,
        side: const BorderSide(width: 0, color: Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 3,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_shopping_cart),
          Text('Ajouter au panier'),
        ],
      ),
    );
  }

  /// Actions effectuée lors de l'appui sur le bouton.
  void _onAddCart(BuildContext context) {
    context.read<CartBloc>().add(CartAddProduct(product));

    // Affichage de la confirmation d'ajout.
    Fluttertoast.showToast(
      msg: 'Le panier a été mis à jour.',
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}

import 'package:flutter/material.dart';

class ProductAddCartButton extends StatelessWidget {
  const ProductAddCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
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
}

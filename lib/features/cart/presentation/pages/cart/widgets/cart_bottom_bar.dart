import 'package:flutter/material.dart';
import 'package:shop_test/features/cart/data/cart.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProductCount(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildTotalPrice(),
          ),
          _buildBuyButton(),
        ],
      ),
    );
  }

  /// Affiche le bouton d'achat.
  Widget _buildBuyButton() {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      onPressed: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10,
        ),
        child: Text(
          'PAYER',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Affiche le nombre total de produits.
  Widget _buildProductCount() {
    return Text(
      '${cart.totalProducts} article(s)',
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    );
  }

  /// Affiche le prix total du panier.
  Widget _buildTotalPrice() {
    // On découpe le prix en deux parties
    final List<String> price = cart.totalPrice.toStringAsFixed(2).split('.');

    return Text.rich(
      TextSpan(
        text: price[0],
        children: [
          TextSpan(
            text: '.${price[1]}€',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/features/cart/data/cart.dart';
import 'package:shop_test/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:shop_test/features/cart/presentation/pages/cart/widgets/cart_bottom_bar.dart';
import 'package:shop_test/features/cart/presentation/pages/cart/widgets/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  final Cart cart;

  const CartScreen({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) => current is CartUpdated,
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: cart.isEmpty
                      ? _buildEmpty(context)
                      : ListView.builder(
                          itemCount: cart.products.length,
                          itemBuilder: (context, index) => CartListItem(
                            item: cart.products[index],
                          ),
                        ),
                ),
                CartBottomBar(cart: cart),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Text(
        'Le panier est vide.',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              text: 'Panier',
              children: [
                TextSpan(
                  text: ' (${cart.totalProducts})',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 19,
                  ),
                  Text(
                    'Livrer en France',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

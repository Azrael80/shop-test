part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

/// Etat du panier mis à jour.
class CartUpdated extends CartState {
  final Cart cart;
  final int totalProducts;
  final double totalPrice;

  const CartUpdated(this.cart,
      {required this.totalProducts, required this.totalPrice});

  @override
  List<Object> get props => [
        totalPrice,
        totalProducts,
      ];
}

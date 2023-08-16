part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

/// Ajout de produits au panier.
class CartAddProduct extends CartEvent {
  final ProductEntity product;
  final int count;

  const CartAddProduct(this.product, {this.count = 1});

  @override
  List<Object> get props => [product.id ?? 0, count];
}

/// Suppression de produits du panier.
class CartRemoveProduct extends CartEvent {
  final ProductEntity product;
  final int count;

  const CartRemoveProduct(this.product, {this.count = 1});

  @override
  List<Object> get props => [product.id ?? 0, count];
}

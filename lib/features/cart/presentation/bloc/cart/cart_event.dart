part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartAddProduct extends CartEvent {
  final ProductEntity product;
  final int count;

  const CartAddProduct(this.product, {this.count = 1});

  @override
  List<Object> get props => [product.id ?? 0, count];
}

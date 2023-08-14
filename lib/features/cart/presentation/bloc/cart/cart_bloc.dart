import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_test/features/cart/data/cart.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Cart _cart;

  CartBloc({Cart? cart})
      : _cart = cart ?? Cart(),
        super(CartInitial()) {
    on<CartAddProduct>(_onCartAddProduct);
  }

  /// Ajout d'objets au panier
  void _onCartAddProduct(CartAddProduct event, Emitter emit) {
    _cart.addProduct(event.product, count: event.count);
    emit(
      CartUpdated(
        _cart,
        totalPrice: _cart.totalPrice,
        totalProducts: _cart.totalProducts,
      ),
    );
  }
}

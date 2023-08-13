import 'package:shop_test/model/product.dart';

class CartItem {
  /// Id du produit.
  final int productId;

  /// Produit.
  Product? product;

  /// Nombre d'items.
  int count;

  CartItem(
    this.productId, {
    required this.count,
    this.product,
  });

  double get totalPrice => product != null ? product!.price * count : 0;
}

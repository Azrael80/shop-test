import 'package:shop_test/features/products/domain/entities/product.dart';

class CartItem {
  /// Produit concerné.
  final ProductEntity product;

  /// Nombre de produits
  int count;

  double get price => count * (product.price ?? 0);

  CartItem({required this.product, required this.count});
}

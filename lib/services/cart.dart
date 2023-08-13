import 'package:shop_test/model/cart_item.dart';

class Cart {
  static final Cart _repository = Cart._();

  /// Liste des items du panier.
  List<CartItem> items = [];

  /// Singleton du panier, on en a besoin que d'un seul par application.
  factory Cart() => _repository;

  Cart._();
}
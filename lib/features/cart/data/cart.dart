import 'package:shop_test/features/products/domain/entities/product.dart';
import 'package:shop_test/features/cart/data/cart_item.dart';

class Cart {
  /// Produits du panier.
  final List<CartItem> products = [];

  /// Singleton du panier
  static final Cart _cart = Cart.create();

  factory Cart() {
    return _cart;
  }

  Cart.create();

  /// Prix total du panier.
  double get totalPrice => products.fold(0, (sum, item) => sum + item.price);

  /// Nombre total de produits.
  int get totalProducts => products.fold(0, (sum, item) => sum + item.count);

  /// Le panier est vide.
  bool get isEmpty => totalProducts == 0;

  /// Ajoute des produits au panier.
  void addProduct(ProductEntity product, {int count = 1}) {
    // Récupération du produit à changer
    final int productIndex =
        products.indexWhere((item) => item.product.id == product.id);

    // Le produit n'existe pas, on l'ajoute.
    if (productIndex == -1) {
      products.add(CartItem(product: product, count: count));
      return;
    }

    // Modification du produit existant dans le panier.
    products[productIndex].count += count;
  }

  /// Met à jour le nombre de produits dans le panier.
  void updateProductCount(ProductEntity product, int count) {
    // Le nouveau compte est à moins d'un produit, alors
    // on le supprime.
    if (count < 1) {
      return removeProduct(product);
    }

    // Récupération du produit à changer
    final int productIndex =
        products.indexWhere((item) => item.product.id == product.id);

    // Le produit n'existe pas, on l'ajoute.
    if (productIndex == -1) {
      products.add(CartItem(product: product, count: count));
      return;
    }

    // Modification du produit existant dans le panier.
    products[productIndex].count = count;
  }

  /// Supprime des produits du panier.
  void removeProduct(ProductEntity product) {
    products.removeWhere((item) => item.product.id == product.id);
  }
}

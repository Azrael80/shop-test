import 'package:shop_test/features/cart/data/cart.dart';
import 'package:shop_test/features/cart/data/cart_item.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';
import 'package:test/test.dart';

void main() {
  group('Cart addProduct', () {
    test("Test l'ajout d'un seul objet", () {
      final cart = Cart.create();
      cart.addProduct(const ProductEntity(id: 1));

      expect(cart.totalProducts, 1);
    });

    test("Test l'ajout de 100 objets", () {
      final cart = Cart.create();
      cart.addProduct(const ProductEntity(id: 1), count: 100);

      expect(cart.totalProducts, 100);
    });

    test("Test l'ajout de 0 objets", () {
      final cart = Cart.create();
      cart.addProduct(const ProductEntity(id: 1), count: 0);

      expect(cart.totalProducts, 0);
    });

    test("Test l'ajout de 1 objet dans un panier en contenant plusieurs", () {
      final cart = Cart.create();
      cart.products
          .add(CartItem(product: const ProductEntity(id: 2), count: 2000));
      cart.addProduct(const ProductEntity(id: 1), count: 1);

      expect(cart.totalProducts, 2001);
    });
  });

  group('Cart updateProduct', () {
    test("Test de la mise à jour d'un objet non présent", () {
      final cart = Cart.create();
      cart.updateProductCount(const ProductEntity(id: 1), 10);

      expect(cart.totalProducts, 10);
    });

    test("Test de la mise à jour d'un objet déjà présent", () {
      final cart = Cart.create();
      const product = ProductEntity(id: 1);

      cart.products.add(CartItem(product: product, count: 2000));
      cart.updateProductCount(product, 10);

      expect(cart.totalProducts, 10);
    });
  });

  group('Cart deleteProduct', () {
    test("Test de la suppression d'un objet non présent", () {
      final cart = Cart.create();
      cart.deleteProduct(const ProductEntity(id: 1));

      expect(cart.totalProducts, 0);
    });

    test("Test de la suppression d'un objet présent", () {
      final cart = Cart.create();
      const product = ProductEntity(id: 1);

      cart.products
          .add(CartItem(product: const ProductEntity(id: 2), count: 2000));
      cart.deleteProduct(product);

      expect(cart.totalProducts, 2000);
    });
  });
}

import 'package:shop_test/abstract/repository.dart';
import 'package:shop_test/dao/product_api_dao.dart';
import 'package:shop_test/model/product.dart';

class ProductRepository extends Repository<Product> {
  static final ProductRepository _repository = ProductRepository._();

  /// Singleton du repository.
  factory ProductRepository() => _repository;

  ProductRepository._() : super(dao: ProductAPIDAO());

  @override
  Future<Product?> getById(id) async {
    // Récupération du JSON du produit.
    Map<String, dynamic>? json = await dao.getById(id);

    // Aucun produit, on retourne null.
    if (json == null) {
      return null;
    }

    return Product.fromJson(json);
  }

  @override
  Future<List<Product>> getAll({int? page, int? limit}) async {
    // Récupération du JSON des produits.
    List<Map<String, dynamic>> jsons = await dao.getAll();

    // Aucune données, on retourne une liste vide.
    if (jsons.isEmpty) {
      return [];
    }

    // Création des différentes entités à partir du json.
    return jsons.map((json) => Product.fromJson(json)).toList();
  }
}

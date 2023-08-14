import 'package:shop_test/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:shop_test/features/products/data/models/product.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';
import 'package:shop_test/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;

  ProductRepositoryImpl(this._productApiService);

  @override
  Future<ProductEntity?> getById(id) async {
    // Récupération du JSON du produit.
    Map<String, dynamic>? json = await _productApiService.getById(id);

    // Aucun produit, on retourne null.
    if (json == null) {
      return null;
    }

    return ProductModel.fromJson(json);
  }

  @override
  Future<List<ProductEntity>> getAll({int? page, int? limit}) async {
    // Récupération du JSON des produits.
    List<Map<String, dynamic>> jsons = await _productApiService.getAll();

    // Aucune données, on retourne une liste vide.
    if (jsons.isEmpty) {
      return [];
    }

    // Création des différentes entités à partir du json.
    return jsons.map((json) => ProductModel.fromJson(json)).toList();
  }
}

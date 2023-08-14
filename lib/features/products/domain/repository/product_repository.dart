import 'package:shop_test/features/products/domain/entities/product.dart';

abstract class ProductRepository<T> {
  /// Permet de récupérer une entité par son [id].
  Future<ProductEntity?> getById(dynamic id);

  /// Permet de récupérer une liste d'entitées en fonction d'une [limit]
  /// ainsi que d'une [page] courante.
  Future<List<ProductEntity>> getAll({
    int? page,
    int? limit,
  });
}

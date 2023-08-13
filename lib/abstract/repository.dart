import 'package:shop_test/abstract/dao.dart';

abstract class Repository<T> {
  DAO dao;

  Repository({required this.dao});

  /// Permet de récupérer une entité par son [id].
  Future<T?> getById(dynamic id);

  /// Permet de récupérer une liste d'entitées en fonction d'une [limit]
  /// ainsi que d'une [page] courante.
  Future<List<T>> getAll({
    int? page,
    int? limit,
  });
}

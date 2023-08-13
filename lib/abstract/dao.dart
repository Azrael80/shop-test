abstract class DAO {
  /// Permet de récupérer les données d'une entité en utilisant
  /// son [id].
  Future<Map<String, dynamic>?> getById(dynamic id);

  /// Permet de récupérer une liste d'entitées en fonction d'une [limit]
  /// ainsi que d'une [page] courante.
  Future<List<Map<String, dynamic>>> getAll({
    int? page,
    int? limit,
  });
}

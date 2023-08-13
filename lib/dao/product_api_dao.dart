import 'dart:convert';

import 'package:shop_test/abstract/dao.dart';
import 'package:http/http.dart' as http;
import 'package:shop_test/config/api.dart';

class ProductAPIDAO extends DAO {
  @override
  Future<Map<String, dynamic>?> getById(id) async {
    http.Response response =
        await http.get(Uri.parse('${API.url}/products/$id'));

    // On a pu récupérer un produit on retourne son JSON.
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return null;
  }

  @override
  Future<List<Map<String, dynamic>>> getAll({int? page, int? limit}) async {
    http.Response response = await http.get(Uri.parse('${API.url}/products'));

    // On a un résultat on le retourne.
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    }

    // Sinon on retourne une liste vide.
    return List<Map<String, dynamic>>.empty();
  }
}

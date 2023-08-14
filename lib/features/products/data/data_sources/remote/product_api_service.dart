import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shop_test/config/api/api.dart';

class ProductApiService {
  /// Permet de récupérer un produit par son [id].
  Future<Map<String, dynamic>?> getById(id) async {
    http.Response response =
        await http.get(Uri.parse('${API.url}/products/$id'));

    // On a pu récupérer un produit on retourne son JSON.
    if (response.statusCode == HttpStatus.ok) {
      return jsonDecode(response.body);
    }

    return null;
  }

  /// Permet de récupérer tous les produits.
  Future<List<Map<String, dynamic>>> getAll({int? page, int? limit}) async {
    http.Response response = await http.get(Uri.parse('${API.url}/products'));

    // On a un résultat on le retourne.
    if (response.statusCode == HttpStatus.ok) {
      return List<Map<String, dynamic>>.from(
          jsonDecode(response.body)['products']);
    }

    // Sinon on retourne une liste vide.
    return List<Map<String, dynamic>>.empty();
  }
}

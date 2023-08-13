import 'package:shop_test/model/rating.dart';

class Product {
  /// Id du produit.
  int id;

  /// Nom du produit.
  String title;

  /// Prix du produit.
  double price;

  /// Description du produit.
  String description;

  /// Catégorie du produit.
  String category;

  /// URL de l'image du produit.
  String image;

  /// Note du produit.
  Rating? rating;

  /// Création d'un produit depuis son JSON.
  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = double.tryParse(json['price'].toString()) ?? 0,
        description = json['description'],
        category = json['category'],
        image = json['image'],
        rating =
            json['rating'] != null ? Rating.fromJson(json['rating']) : null;

  /// Conversion d'un produit en JSON.
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        // 'rating': rating?.toJson(),
      };
}

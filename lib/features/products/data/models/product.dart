import 'package:shop_test/features/products/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    double? rating,
    int? stock,
    String? brand,
    String? thumbnail,
    List<String>? images,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          rating: rating,
          stock: stock,
          brand: brand,
          thumbnail: thumbnail,
        );

  /// Création d'un produit depuis son JSON.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: double.tryParse(json['price'].toString()) ?? 0,
      description: json['description'],
      rating: double.tryParse(json['rating'].toString()) ?? 0,
      category: json['category'],
      thumbnail: json['thumbnail'],
      brand: json['brand'],
      stock: json['stock'] ?? 0,
      images: List<String>.from(json['images']),
    );
  }
}

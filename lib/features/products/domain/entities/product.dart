import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  /// Id du produit.
  final int? id;

  /// Nom du produit.
  final String? title;

  /// Prix du produit.
  final double? price;

  /// Description du produit.
  final String? description;

  /// Catégorie du produit.
  final String? category;

  /// Note du produit.
  final double? rating;

  /// Stock du produit.
  final int? stock;

  /// Marque du produit.
  final String? brand;

  /// Image miniature du produit.
  final String? thumbnail;

  /// Images du produit.
  final List<String>? images;

  const ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.rating,
    this.stock,
    this.brand,
    this.thumbnail,
    this.images,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        rating,
        stock,
        brand,
        thumbnail,
        images,
      ];
}

part of 'product_list_bloc.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

final class ProductListInitial extends ProductListState {}

/// Etat chargement de la liste des produits.
class ProductListLoading extends ProductListState {
  const ProductListLoading();
}

/// Erreur lors du chargement des produits.
class ProductListLoadingError extends ProductListState {
  const ProductListLoadingError();
}

/// Etat liste des produits chargés.
class ProductListLoaded extends ProductListState {
  final List<ProductEntity> products;
  final bool hasReachedMax;

  const ProductListLoaded({
    required this.products,
    required this.hasReachedMax,
  });

  ProductListLoaded copyWith({
    List<ProductEntity>? products,
    bool? hasReachedMax,
  }) {
    return ProductListLoaded(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [products, hasReachedMax];
}

part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

/// Evenemùent
class ProductListLoad extends ProductListEvent {
  final String query;

  const ProductListLoad({
    required this.query,
  });

  @override
  List<Object> get props => [
        query,
      ];
}

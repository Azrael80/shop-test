// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';
import 'package:shop_test/features/products/domain/repository/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  /// Limite de produits par page.
  static const LIMIT = 10;

  /// Dernier état de chargement.
  ProductListLoaded? lastLoadedState;

  /// Dernière recherche effectuée.
  String query = '';

  final ProductRepository _productRepository;

  /// Permet de modifier le temps pour le chargement de la liste après
  /// avoir scroll.
  ///
  /// [duration]
  EventTransformer<ProductListLoad> _debounceProductListLoad<ProductListLoad>(
    Duration duration,
  ) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  ProductListBloc(this._productRepository) : super(ProductListInitial()) {
    on<ProductListLoad>(
      _onProductListLoad,
      transformer: _debounceProductListLoad(
        const Duration(milliseconds: 500),
      ),
    );
  }

  /// Chargement de la liste des produits.
  void _onProductListLoad(ProductListLoad event, Emitter emit) async {
    // Si on est déjà en train de recharger la liste, alors on ne fait rien.
    if (state is ProductListLoading) {
      return;
    }

    // La recherche a changée, on supprime les produits
    // déjà trouvés.
    if (query != event.query) {
      query = event.query;
      _emitLoadedState(
        const ProductListLoaded(products: [], hasReachedMax: false),
        emit,
      );
    }

    emit(const ProductListLoading());

    try {
      if (lastLoadedState == null) {
        // Chargement de la première page de produits.
        final products = await _productRepository.fetch(
          skip: 0,
          limit: LIMIT,
          query: query,
        );

        _emitLoadedState(
          ProductListLoaded(
            products: products,
            hasReachedMax: false,
          ),
          emit,
        );
      } else {
        // Chargement de la page suivante de produits.
        final products = await _productRepository.fetch(
          skip: lastLoadedState!.products.length,
          limit: LIMIT,
          query: query,
        );

        _emitLoadedState(
          products.isEmpty
              ? lastLoadedState!.copyWith(hasReachedMax: true)
              : lastLoadedState!.copyWith(
                  products: lastLoadedState!.products + products,
                  hasReachedMax: false,
                ),
          emit,
        );
      }
    } catch (ex) {
      emit(const ProductListLoadingError());
    }
  }

  /// Envoie du dernier état de chargement.
  void _emitLoadedState(ProductListLoaded state, Emitter emit) {
    lastLoadedState = state;
    emit(state);
  }
}

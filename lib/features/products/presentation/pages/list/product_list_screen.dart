import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_test/common/widgets/grid_list/custom_grid_list.dart';
import 'package:shop_test/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:shop_test/features/products/data/models/product.dart';
import 'package:shop_test/features/products/data/repository/product_repository_impl.dart';
import 'package:shop_test/features/products/domain/entities/product.dart';
import 'package:shop_test/features/products/presentation/bloc/product_list/product_list_bloc.dart';
import 'package:shop_test/features/products/presentation/pages/list/widgets/product_item.dart';
import 'package:shop_test/features/products/presentation/pages/list/widgets/product_loading_item.dart';
import 'package:shop_test/features/products/presentation/pages/list/widgets/product_search_bar.dart';

class ProductListScreen extends StatefulWidget {
  final TextEditingController searchController;

  const ProductListScreen({
    super.key,
    required this.searchController,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductListBloc _bloc;
  List<ProductEntity> products = [];
  bool loading = true;

  // Utile afin de recharger la liste quand on a scroll jusqu'en bas.
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Initialisation du bloc permettant le chargement de la liste
    _bloc = ProductListBloc(ProductRepositoryImpl(ProductApiService()))
      ..add(
        const ProductListLoad(query: ''),
      );

    _scrollController.addListener(_onScroll);

    // Ecoute du champ de recherche, si il change, alors on doit effectuer
    // la recherche.
    widget.searchController.addListener(
      () {
        _bloc.add(
          ProductListLoad(query: widget.searchController.text),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 73),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0)
                    .copyWith(top: 0.0),
                child: BlocBuilder<ProductListBloc, ProductListState>(
                  bloc: _bloc,
                  builder: (context, state) {
                    if (state is ProductListLoading) {
                      loading = true;

                      // Ajout de 5 items vide pour l'effet de chargement
                      for (int i = 0; i < 8; i++) {
                        products.add(const ProductModel(id: null));
                      }
                    }

                    if (state is ProductListLoaded) {
                      products = List<ProductModel>.from(state.products);
                      loading = false;
                    }

                    return CustomGridList(
                      items: products,
                      scrollController: _scrollController,
                      itemBuilder: (item) => item.id != null
                          ? ProductItem(product: item)
                          : const ProductLoadingItem(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        const ProductSearchBar(),
      ],
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 8.0),
      child: BlocBuilder<ProductListBloc, ProductListState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is ProductListLoading) {
            loading = true;

            // Ajout de 5 items vide pour l'effet de chargement
            for (int i = 0; i < 8; i++) {
              products.add(const ProductModel(id: null));
            }
          }

          if (state is ProductListLoaded) {
            products = List<ProductModel>.from(state.products);
            loading = false;
          }

          return CustomGridList(
            items: products,
            scrollController: _scrollController,
            itemBuilder: (item) => item.id != null
                ? ProductItem(product: item)
                : const ProductLoadingItem(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= 200) {
      _bloc.add(const ProductListLoad(query: ''));
    }
  }
}

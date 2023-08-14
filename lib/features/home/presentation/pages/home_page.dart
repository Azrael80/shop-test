import 'package:flutter/material.dart';
import 'package:shop_test/config/routes/app_routes.dart';
import 'package:shop_test/features/home/presentation/widgets/cart/cart_button.dart';
import 'package:shop_test/features/home/presentation/widgets/search/product_search_bar.dart';
import 'package:shop_test/core/util/router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        appBar: _buildAppBar(Theme.of(context)),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            const ProductSearchBar(),
            Expanded(
              child: Navigator(
                key: AppRouter.navigatorKey,
                initialRoute: AppRoutes.PRODUCT_LIST,
                onGenerateRoute: AppRoutes.onGenerateRoutes,
                observers: [AppRouter.observer],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Permet de créer la barre de navigation.
  AppBar _buildAppBar(ThemeData theme) {
    return AppBar(
      backgroundColor: theme.primaryColor,
      titleSpacing: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          const SizedBox(width: 7.0),
          StreamBuilder(
            stream: AppRouter.observer.navigationStream,
            builder: (context, snapshot) {
              final nestedContext = AppRouter.navigatorKey.currentContext;

              // Il n'est pas possible de depop la vue interne actuellement.
              if (nestedContext == null ||
                  !Navigator.of(nestedContext).canPop()) {
                return const SizedBox(width: 0);
              }

              return GestureDetector(
                onTap: _onPop,
                child: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              );
            },
          ),
          const Text('eShop', style: TextStyle(color: Colors.white)),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              theme.primaryColor,
              const Color(0xFF62929E),
            ],
            stops: const [0.5, 1.0],
          ),
        ),
      ),
      actions: const [CartButton(color: Colors.white)],
    );
  }

  /// Action à effectuer si l'utilisateur clique sur le bouton de retour.
  Future<bool> _onPop() async {
    // Si on peut pop le navigateur interne, on le fait,
    // si ce n'est pas possible, c'est que l'utilisateur
    // souhaite quitter l'application.
    if (AppRouter.getNestedNavigator().canPop()) {
      AppRouter.getNestedNavigator().pop();
      return false;
    }

    return true;
  }
}

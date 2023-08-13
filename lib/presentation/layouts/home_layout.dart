import 'package:flutter/material.dart';
import 'package:shop_test/presentation/widgets/search/product_search_bar.dart';
import 'package:shop_test/routing/app_router.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('eShop', style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Theme.of(context).primaryColor,
                  const Color(0xFF62929E),
                ],
                stops: const [0.4, 1.0],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const ProductSearchBar(),
            Expanded(
              child: Navigator(
                key: AppRouter.navigatorKey,
                initialRoute: AppRouter.PRODUCT_LIST,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) =>
                        AppRouter.routes[routeSettings.name]!(context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Action à effectuer si l'utilisateur clique sur le bouton de retour.
  Future<bool> _onPop() async {
    // Si on peut pop le navigateur interne, on le fait,
    // si ce n'est pas possible, c'est que l'utilisateur
    // souhaite quitter l'application.
    // AppRouter.getNestedNavigator().
    if (Navigator.canPop(AppRouter.navigatorKey.currentContext!)) {
      AppRouter.getNestedNavigator().maybePop();
      return false;
    }

    return true;
  }
}

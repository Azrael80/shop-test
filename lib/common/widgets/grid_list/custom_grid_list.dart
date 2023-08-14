import 'package:flutter/material.dart';

class CustomGridList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final double itemWidth;
  final ScrollController? scrollController;

  /// Grille permettant de changer le nombre d'items par ligne, en fonction
  /// de la largeur de l'écran.
  const CustomGridList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.itemWidth = 250,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Choix du nombre d'items par ligne
        final int crossAxisCount = (constraints.maxWidth / itemWidth).ceil();

        return GridView.builder(
          itemCount: items.length,
          shrinkWrap: false,
          controller: scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.8,
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: itemBuilder(items[index]),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class ProductLoadingItem extends StatelessWidget {
  const ProductLoadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(.6),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final Color? color;

  const CartButton({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: color,
            size: 30,
          ),
          onPressed: () {},
        ),
        Positioned(
          right: 11,
          top: 11,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: const Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

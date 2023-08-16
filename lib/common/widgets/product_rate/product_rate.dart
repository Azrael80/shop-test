import 'package:flutter/material.dart';

class ProductRate extends StatelessWidget {
  final double rating;
  final int count;

  const ProductRate({super.key, required this.rating, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: Icon(
            Icons.star,
            color: Colors.orange[400],
            size: 20,
          ),
        ),
        Text.rich(
          TextSpan(
            text: '$rating ',
            children: [
              TextSpan(
                text: '($count)',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

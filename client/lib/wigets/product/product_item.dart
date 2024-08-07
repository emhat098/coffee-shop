import 'dart:math';

import 'package:client/models/product_model.dart';
import 'package:client/screens/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
        margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    "https://picsum.photos/720/361",
                    width: 144,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      children: [
                        Text(product.title),
                        Text(product.price.toString()),
                        ElevatedButton(
                          child: const Text('Preview product'),
                          onPressed: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductScreen(product: product)
                            ),
                        ))
                      ],
                    )
                  )
                ],
             )
            ],
          ),
        );
  }
}

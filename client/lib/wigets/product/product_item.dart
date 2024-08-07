import 'package:client/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    print(product);
    return Card.filled(
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          child: Column(
            children: [
              Image.network(
                "https://picsum.photos/720/360",
                width: 720,
              ),
              Text(product.title),
              Text(product.price.toString()),
            ],
          ),
        ));
  }
}

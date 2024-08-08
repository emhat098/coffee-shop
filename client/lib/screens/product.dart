import 'package:client/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    body: Column(
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
                      Text(product.price.toString()),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

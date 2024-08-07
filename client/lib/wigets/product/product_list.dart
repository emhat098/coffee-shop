import 'package:client/models/product_model.dart';
import 'package:client/wigets/product/product_item.dart';
import 'package:flutter/material.dart';

class ProductListWiget extends StatelessWidget {
  final List<Product> products;
  const ProductListWiget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItem(product: product);
      },
    );
  }
}

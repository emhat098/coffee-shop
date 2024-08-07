import 'dart:convert';

import 'package:client/models/product_model.dart';
import 'package:client/wigets/product/product_item.dart';
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
      body: ProductItem(product: product),
    );
  }
}
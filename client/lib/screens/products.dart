import 'package:client/models/product_model.dart';
import 'package:client/services/product_service.dart';
import 'package:client/wigets/loader/loader_wiget.dart';
import 'package:client/wigets/product/product_list.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final ProductService productService;

  const ProductsScreen({super.key, required this.productService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: LoaderFutureBuilder<List<Product>>(
        future: productService.fetchProducts(),
        builder: (context, products) {
          return ProductListWiget(products: products);
        },
        emptyMessage: 'No products found',
      ),
    );
  }
}

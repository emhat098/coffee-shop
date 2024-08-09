import 'package:client/src/models/product_model.dart';
import 'package:client/src/services/api_service.dart';
import 'package:client/src/services/product_service.dart';
import 'package:client/src/wigets/loader/loader_wiget.dart';
import 'package:client/src/wigets/product/product_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> products;
  late ProductService productService;

  @override
  void initState() {
    super.initState();
    final apiService = ApiService(baseUrl: 'https://dummyjson.com');
    productService = ProductService(apiService: apiService);
    products = productService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderFutureBuilder(
        future: products,
        builder: (context, products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductListViewItem(product: product);
            },
          );
        });
  }
}

import 'package:client/screens/products.dart';
import 'package:client/services/api_service.dart';
import 'package:client/services/product_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ProductService productService =
      ProductService(apiService: ApiService(baseUrl: 'https://dummyjson.com'));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade600),
          useMaterial3: true,
        ),
        home: ProductsScreen(productService: productService));
  }
}

import 'package:client/src/models/product_model.dart';
import 'package:client/src/services/api_service.dart';
import 'package:client/src/services/product_service.dart';
import 'package:client/src/wigets/loader/loader_wiget.dart';
import 'package:client/src/wigets/product/product_list_view_item.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({super.key, required this.productId});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Future<Product> product;
  late ProductService productService;

  @override
  void initState() {
    super.initState();
    final apiService = ApiService(baseUrl: 'https://dummyjson.com');
    productService = ProductService(apiService: apiService);
    product = productService.fetchProductById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return LoaderFutureBuilder(
        future: product,
        builder: (context, product) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(''),
            ),
            body: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 240,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 1),
                          )
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                              product.images[0],
                            ),
                            fit: BoxFit.contain),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            product.title,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                          Text(
                            product.price.toString(),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          const Divider(color: Colors.black12),
                          const Text(
                            "Description:",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            product.description,
                            softWrap: true,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }
}

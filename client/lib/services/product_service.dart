import 'package:client/models/product_model.dart';
import 'package:client/services/api_service.dart';

class ProductService {
  final ApiService apiService;

  ProductService({required this.apiService});

  Future<List<Product>> fetchProducts() async {
    final response = await apiService.fetchData('/product', (json) {
      final List<dynamic> productJson = json['products'];
      return productJson.map((json) => Product.fromJson(json)).toList();
    });

    return response;
  }
}

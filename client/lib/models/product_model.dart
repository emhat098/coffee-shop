/// Product model.
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final int stock;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.stock,
  });

  /// Convert json to Product model.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        price: json['price'] as double,
        stock: json['stock'] as int);
  }
}

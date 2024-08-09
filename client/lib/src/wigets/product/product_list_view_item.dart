import 'package:client/src/models/product_model.dart';
import 'package:client/src/screens/product/product_detail_screen.dart';
import 'package:flutter/material.dart';

/// Product List View Item.
/// This wiget for displaying inside the product list view.
class ProductListViewItem extends StatelessWidget {
  const ProductListViewItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailScreen(productId: product.id)))
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    child: Image.network(
                      product.images[0],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  )),
              Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    product.price.toString(),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

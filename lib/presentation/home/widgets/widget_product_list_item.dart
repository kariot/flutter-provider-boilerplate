import 'package:flutter/material.dart';
import 'package:provider_template/domain/products/products_reponse_model/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.network(
            product.thumbnail ?? '',
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(product.title ?? ''),
            subtitle: Text(product.description ?? ''),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mini_market/data/categories.dart';
import 'package:mini_market/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final productColor = colorForCategory(product.category);
    final productIcon = iconForCategory(product.category);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: productColor.withAlpha((0.12 * 255).round()),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(productIcon, size: 34, color: productColor),
              ),
            ),
            const SizedBox(height: 10),
            Text(product.title, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text(
              '\$${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

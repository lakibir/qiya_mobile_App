import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_market/data/categories.dart';
import 'package:mini_market/data/market_store.dart';

class ProductDetails extends StatefulWidget {
  final String productId;

  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = MarketStore.findProduct(widget.productId);

    if (product == null) {
      return const Scaffold(body: Center(child: Text('Product not found')));
    }

    final productColor = colorForCategory(product.category);
    final productIcon = iconForCategory(product.category);

    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: productColor.withAlpha((0.12 * 255).round()),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(productIcon, size: 80, color: productColor),
            ),
            const SizedBox(height: 20),
            Text(
              product.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(product.description),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text('Quantity: ', style: TextStyle(fontSize: 16)),
                IconButton(
                  onPressed: quantity > 1
                      ? () => setState(() => quantity--)
                      : null,
                  icon: const Icon(Icons.remove),
                ),
                Text('$quantity', style: const TextStyle(fontSize: 18)),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  MarketStore.addToCart(product, quantity);
                  context.pop();
                },
                child: const Text('Add to cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

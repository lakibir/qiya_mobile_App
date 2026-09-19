import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_market/data/market_store.dart';
import 'package:mini_market/screens/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _openCart() async {
    await context.push('/cart');

    setState(() {});
  }

  Future<void> _openProduct({required String id}) async {
    await context.push('/product/${Uri.encodeComponent(id)}');

    setState(() {});
  }

  Future<void> _openProductForm() async {
    await context.push('/add-product');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = MarketStore.cartCount;
    final products = MarketStore.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Market'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: _openCart,
              child: Badge(
                isLabelVisible: itemCount > 0,
                label: Text(itemCount.toString()),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              product: product,
              onTap: () => _openProduct(id: product.id),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openProductForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}

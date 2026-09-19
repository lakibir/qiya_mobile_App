import 'package:flutter/material.dart';
import 'package:mini_market/data/market_store.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartItems = MarketStore.cart;

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('Your cart is empty'),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item.product.title),
                  subtitle: Text('Qty: ${item.quantity}'),
                  trailing: Text('\$${item.total.toStringAsFixed(0)}'),
                );
              },
            ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  MarketStore.clearCart();
                  setState(() {});
                },
                child: Text('Checkout - \$${MarketStore.cartTotal.toStringAsFixed(0)}'),
              ),
            ),
    );
  }
}

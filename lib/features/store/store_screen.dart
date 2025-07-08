import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart or perform an action
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to the Store!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

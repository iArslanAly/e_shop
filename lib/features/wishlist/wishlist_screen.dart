import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit wishlist screen or perform an action
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Your Wishlist is empty!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

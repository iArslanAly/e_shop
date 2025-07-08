import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit profile screen or perform an action
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to your profile!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

import 'package:e_shop/features/home/home_screen.dart';
import 'package:e_shop/features/navigation/bloc/navigation_bloc.dart';
import 'package:e_shop/features/profile/profile_screen.dart';
import 'package:e_shop/features/store/store_screen.dart';
import 'package:e_shop/features/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  static final List<Widget Function()> _screenBuilders = [
    () => const HomeScreen(),
    () => const StoreScreen(),
    () => const WishlistScreen(),
    () => const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: _screenBuilders[state.currentIndex](),
          bottomNavigationBar: NavigationBar(
            height: 70,
            selectedIndex: state.currentIndex,
            onDestinationSelected: (index) {
              context.read<NavigationBloc>().add(NavigationTabChanged(index));
            },
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                icon: Icon(Iconsax.heart_add),
                label: 'Wishlist',
              ),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}

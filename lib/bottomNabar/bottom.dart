import 'package:flutter/material.dart';
import 'package:ludo/Screen/HomeScreen.dart';
import 'package:ludo/Screen/LeaderScreen.dart';
import 'package:ludo/Screen/QuickguideScreen.dart';
import 'package:ludo/Screen/StoreScreen.dart';
import 'package:ludo/Screen/WalletScreen.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Widget image; // Replace icon with a custom image widget

  TabNavigationItem({
    required this.page,
    required this.title,
    required this.image, // Add the custom image property
  });

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: const Storescreen(),
      image: Image.asset(  'assets/image/cart.png', height: 30), // Replace with your custom image
      title: const Text("Home"),
    ),
    TabNavigationItem(
      page: const Leaderscreen(),
      image: Image.asset( 'assets/image/trophy.png', height: 30), // Replace with your custom image
      title: const Text("Swipable"),
    ),
    TabNavigationItem(
      page: const HomeScreen(),
      image: Image.asset( 'assets/image/cart.png', height: 30), // Replace with your custom image
      title: const Text("Swipable"),
    ),
    TabNavigationItem(
      page: const WalletScreen(),
      image: Image.asset( 'assets/image/cart.png', height: 30), // Replace with your custom image
      title: const Text("Swipable"),
    ),
    TabNavigationItem(
      page: const Quickguidescreen(),
      image: Image.asset( 'assets/image/cart.png', height: 30), // Replace with your custom image
      title: const Text("Swipable"),
    ),
  ];
}

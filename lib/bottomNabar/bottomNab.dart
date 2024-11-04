import 'dart:async';
import 'dart:math'; // Corrected import for Random

import 'package:flutter/material.dart';
import 'package:ludo/Screen/HomeScreen.dart';
import 'package:ludo/Screen/LeaderScreen.dart';
import 'package:ludo/Screen/QuickguideScreen.dart';
import 'package:ludo/Screen/StoreScreen.dart';
import 'package:ludo/Screen/WalletScreen.dart';
import 'package:ludo/widgets/containerScreen.dart';

class BottomNab extends StatefulWidget {
  @override
  _BottomNabState createState() => _BottomNabState();
}

class _BottomNabState extends State<BottomNab> {
  Timer? _randomPopupTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _scheduleRandomPopup(); // Schedule the random popup when the app starts
  }

  void _scheduleRandomPopup() {
    // Schedule a popup between 5 to 15 seconds
    final delay = Duration(seconds: 5 + _random.nextInt(10));
    _randomPopupTimer = Timer(delay, _showRandomPopup);
  }

  void _showRandomPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Containerscreen(), // Show the Containerscreen as a popup
        );
      },
    ).then((_) {
      _scheduleRandomPopup(); // Reschedule the next random popup after closing
    });
  }

  @override
  void dispose() {
    _randomPopupTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  int _selectedIndex = 2; // The index of the selected tab

  final List<Widget> _pages = [
    const Storescreen(),
    const Leaderscreen(), // Replace with actual pages
    const HomeScreen(),
    const WalletScreen(),
    const Quickguidescreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: const Color(0xFF980E0E),
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF980E0E),
            ),
          ),
          height: 80.0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildTabItem(
                  imageAsset: 'assets/image/cart.png',
                  label: 'STORE',
                  index: 0,
                  isSelected: _selectedIndex == 0,
                ),
                _buildTabItem(
                  imageAsset: 'assets/image/trophy.png',
                  label: 'LEADER BOARD',
                  index: 1,
                  isSelected: _selectedIndex == 1,
                ),
                _buildTabItem(
                  imageAsset: 'assets/image/home1.png',
                  label: 'HOME',
                  index: 2,
                  isSelected: _selectedIndex == 2,
                  isMiddle: true,
                ),
                _buildTabItem(
                  imageAsset: 'assets/image/pink.png',
                  label: 'WALLET',
                  index: 3,
                  isSelected: _selectedIndex == 3,
                ),
                _buildTabItem(
                  imageAsset: 'assets/image/book.png',
                  label: 'QUICKGUID',
                  index: 4,
                  isSelected: _selectedIndex == 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required String imageAsset,
    required String label,
    required int index,
    required bool isSelected,
    bool isMiddle = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          height: isSelected ? 140.0 : 70.0, // Make selected tab taller
          width: isSelected ? 130.0 : 80.0, // Make selected tab wider
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 1),
            color: isSelected
                ? Colors.white.withOpacity(0.5)
                : Colors.white.withOpacity(0.3),
            borderRadius: isMiddle || isSelected
                ? BorderRadius.circular(13.0)
                : BorderRadius.circular(2.0),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max, // Minimize the column size
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  imageAsset,
                  height: isSelected ? 0 : 40, // Adjust image size
                  width: isSelected ? 90 : 60,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSelected
                        ? 16
                        : 14, // Adjust font size for selected tab
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


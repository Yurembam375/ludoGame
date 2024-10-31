import 'package:flutter/material.dart';
import 'package:ludo/Screen/GameScreen.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Here you might want to check some condition from gameState
            // if (gameState.canNavigate) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameScreen()),
            );
            // }
          },
          child: const Text('Go to Home Page'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

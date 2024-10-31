import 'package:flutter/material.dart';
import 'package:ludo/gameengine/model/game_state.dart';
import 'package:ludo/widgets/dice.dart';
import 'package:ludo/gameplay.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  GameScreen() : super();

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GlobalKey keyBar = GlobalKey();
  void _onPressed() {
  }
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    return Scaffold(
         backgroundColor: Colors.red,
      appBar: AppBar(
        key: keyBar,
        title: Text('Ludo'),
      ),
      body: GamePlay(keyBar,gameState),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: Dice(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
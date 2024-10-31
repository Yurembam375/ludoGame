import 'package:flutter/material.dart';
import 'package:ludo/bottomNabar/bottomNab.dart';
import 'package:ludo/gameengine/model/dice_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'gameengine/model/game_state.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameState()),
        ChangeNotifierProvider(create: (_) => DiceModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Set this to match your design resolution
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNab(),
        );
      },
    );
  }
}

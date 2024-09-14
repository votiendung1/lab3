import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int player1 = 1;
  int player2 = 1;
  bool playerTurn = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Spacer(),
              const Text(
                "Player 1",
                textScaleFactor: 4,
              ),
              Visibility(visible: playerTurn, child: const Text("Yours turn", textScaleFactor: 2,)),
              IgnorePointer(
                ignoring: !playerTurn,
                child: InkWell(
                  child: Image.asset(
                    'assets/dice$player1.png',
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    setState(() {
                      player1 = Random().nextInt(6) + 1;
                      playerTurn = !playerTurn;
                    });
                  },
                ),
              ),
              Spacer(),
              const Text(
                "Player 2",
                textScaleFactor: 4,
              ),
              Visibility(visible: !playerTurn, child: Text("Yours turn", textScaleFactor: 2,)),
              IgnorePointer(
                ignoring: playerTurn,
                child: InkWell(
                  child: Image.asset(
                    'assets/dice$player2.png',
                    width: 100,
                    height: 100,
                  ),
                  onTap: () {
                    setState(() {
                      player2 = Random().nextInt(6) + 1;
                      playerTurn = !playerTurn;
                    });
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

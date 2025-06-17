import 'package:math_game/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final game = MathBubbleGame();

  runApp(MyApp(game: game));
}

class MyApp extends StatelessWidget {
  final MathBubbleGame game;

  const MyApp({super.key, required this.game});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: GameScreen(game: game),
    );
  }
}

class GameScreen extends StatelessWidget {
  final MathBubbleGame game;
  const GameScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(
            game: game,
            overlayBuilderMap: {
              'GameOver': (context, game) =>
                  GameOverOverlay(game: game as MathBubbleGame),
            },
          ), // Игровой виджет
        ],
      ),
    );
  }
}

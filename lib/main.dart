import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/math_game_cubit.dart';
import 'package:math_game/math_game/domain/bloc/math_game_state.dart';
import 'package:math_game/math_game/ui/math_game_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cubit = MathGameCubit(MathGameState());
  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        ),
        home: MathGameScreen(),
      ),
    );
  }
}

// class GameScreen extends StatelessWidget {
//   final MathBubbleGame game;
//   const GameScreen({super.key, required this.game});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GameWidget(
//             game: game,
//             overlayBuilderMap: {
//               'GameOver': (context, game) =>
//                   GameOverOverlay(game: game as MathBubbleGame),
//             },
//           ), // Игровой виджет
//         ],
//       ),
//     );
//   }
// }

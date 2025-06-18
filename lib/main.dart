import 'package:flutter/material.dart';
import 'package:math_game/router/app_router.dart';

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
  final _appRouter = AppRouter();
  final _routeProvider = PlatformRouteInformationProvider(
    initialRouteInformation: RouteInformation(
      location: Navigator.defaultRouteName,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routeInformationProvider: _routeProvider,
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

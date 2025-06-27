import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/common/snack/snack_bloc.dart';
import 'package:math_game/generated/l10n.dart';
import 'package:math_game/router/app_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  final _routeProvider = PlatformRouteInformationProvider(
    initialRouteInformation: const RouteInformation(
      location: Navigator.defaultRouteName,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<SnackBloc>(create: (_) => SnackBloc())],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        locale: const Locale('ru', 'RU'),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routeInformationProvider: _routeProvider,
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

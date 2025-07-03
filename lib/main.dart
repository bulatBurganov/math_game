import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/common/snack/snack_bloc.dart';
import 'package:math_game/flavors.dart';
import 'package:math_game/generated/l10n.dart';
import 'package:math_game/router/app_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void mainRunApp(Flavor flavor) {
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.greenAccent,
            brightness: Brightness.light,
          ),
          // brightness: const ColorScheme.dark().brightness,
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

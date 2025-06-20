// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:math_game/main_menu/main_menu_screen.dart' as _i6;
import 'package:math_game/math_game/ui/game_flow_wrapper_screen.dart' as _i2;
import 'package:math_game/math_game/ui/game_over_screen.dart' as _i3;
import 'package:math_game/math_game/ui/game_settings_screen.dart' as _i4;
import 'package:math_game/math_game/ui/math_game_screen.dart' as _i7;
import 'package:math_game/router/app_wrapper_screen.dart' as _i1;
import 'package:math_game/router/home_wrapper_screen.dart' as _i5;

/// generated route for
/// [_i1.AppWrapperScreen]
class AppWrapperRoute extends _i8.PageRouteInfo<void> {
  const AppWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(AppWrapperRoute.name, initialChildren: children);

  static const String name = 'AppWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i1.AppWrapperScreen());
    },
  );
}

/// generated route for
/// [_i2.GameFlowWrapperScreen]
class GameFlowWrapperRoute extends _i8.PageRouteInfo<void> {
  const GameFlowWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(GameFlowWrapperRoute.name, initialChildren: children);

  static const String name = 'GameFlowWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i2.GameFlowWrapperScreen());
    },
  );
}

/// generated route for
/// [_i3.GameOverScreen]
class GameOverRoute extends _i8.PageRouteInfo<GameOverRouteArgs> {
  GameOverRoute({
    _i9.Key? key,
    required int scores,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         GameOverRoute.name,
         args: GameOverRouteArgs(key: key, scores: scores),
         initialChildren: children,
       );

  static const String name = 'GameOverRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GameOverRouteArgs>();
      return _i3.GameOverScreen(key: args.key, scores: args.scores);
    },
  );
}

class GameOverRouteArgs {
  const GameOverRouteArgs({this.key, required this.scores});

  final _i9.Key? key;

  final int scores;

  @override
  String toString() {
    return 'GameOverRouteArgs{key: $key, scores: $scores}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GameOverRouteArgs) return false;
    return key == other.key && scores == other.scores;
  }

  @override
  int get hashCode => key.hashCode ^ scores.hashCode;
}

/// generated route for
/// [_i4.GameSettingsScreen]
class GameSettingsRoute extends _i8.PageRouteInfo<void> {
  const GameSettingsRoute({List<_i8.PageRouteInfo>? children})
    : super(GameSettingsRoute.name, initialChildren: children);

  static const String name = 'GameSettingsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.GameSettingsScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeWrapperScreen]
class HomeWrapperRoute extends _i8.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeWrapperRoute.name, initialChildren: children);

  static const String name = 'HomeWrapperRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i5.HomeWrapperScreen());
    },
  );
}

/// generated route for
/// [_i6.MainMenuScreen]
class MainMenuRoute extends _i8.PageRouteInfo<void> {
  const MainMenuRoute({List<_i8.PageRouteInfo>? children})
    : super(MainMenuRoute.name, initialChildren: children);

  static const String name = 'MainMenuRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainMenuScreen();
    },
  );
}

/// generated route for
/// [_i7.MathGameScreen]
class MathGameRoute extends _i8.PageRouteInfo<void> {
  const MathGameRoute({List<_i8.PageRouteInfo>? children})
    : super(MathGameRoute.name, initialChildren: children);

  static const String name = 'MathGameRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.MathGameScreen();
    },
  );
}

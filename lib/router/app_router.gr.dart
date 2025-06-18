// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:math_game/main_menu/main_menu_screen.dart' as _i3;
import 'package:math_game/math_game/ui/math_game_screen.dart' as _i4;
import 'package:math_game/router/app_wrapper_screen.dart' as _i1;
import 'package:math_game/router/home_wrapper_screen.dart' as _i2;

/// generated route for
/// [_i1.AppWrapperScreen]
class AppWrapperRoute extends _i5.PageRouteInfo<void> {
  const AppWrapperRoute({List<_i5.PageRouteInfo>? children})
    : super(AppWrapperRoute.name, initialChildren: children);

  static const String name = 'AppWrapperRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.WrappedRoute(child: const _i1.AppWrapperScreen());
    },
  );
}

/// generated route for
/// [_i2.HomeWrapperScreen]
class HomeWrapperRoute extends _i5.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeWrapperRoute.name, initialChildren: children);

  static const String name = 'HomeWrapperRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.WrappedRoute(child: const _i2.HomeWrapperScreen());
    },
  );
}

/// generated route for
/// [_i3.MainMenuScreen]
class MainMenuRoute extends _i5.PageRouteInfo<void> {
  const MainMenuRoute({List<_i5.PageRouteInfo>? children})
    : super(MainMenuRoute.name, initialChildren: children);

  static const String name = 'MainMenuRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainMenuScreen();
    },
  );
}

/// generated route for
/// [_i4.MathGameScreen]
class MathGameRoute extends _i5.PageRouteInfo<void> {
  const MathGameRoute({List<_i5.PageRouteInfo>? children})
    : super(MathGameRoute.name, initialChildren: children);

  static const String name = 'MathGameRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.MathGameScreen();
    },
  );
}

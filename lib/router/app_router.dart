import 'package:auto_route/auto_route.dart';
import 'package:math_game/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: AppWrapperRoute.page,
      path: '/',
      initial: true,
      children: [homeRutes],
    ),
  ];
}

final homeRutes = CustomRoute(
  initial: true,
  page: HomeWrapperRoute.page,
  path: 'home',
  children: [
    AutoRoute(initial: true, page: MainMenuRoute.page, path: 'main_menu'),
    AutoRoute(page: MathGameRoute.page, path: 'math_game'),
  ],
);

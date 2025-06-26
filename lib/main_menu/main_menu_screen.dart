import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:math_game/common/widgets/bounce_button.dart';
import 'package:math_game/generated/l10n.dart';
import 'package:math_game/router/app_router.gr.dart';

@RoutePage()
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(
                top: MediaQuery.of(context).padding.top + 50,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  S.of(context).app_name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 50,
                child: BounceButton(
                  onTap: () {
                    context.router.push(const GameFlowWrapperRoute());
                  },
                  child: Text(S.of(context).start_game),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              // Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primary,
            ],
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 50,
                  child: BounceButton(
                    onTap: () {
                      context.router.push(const GameFlowWrapperRoute());
                    },
                    text: S.of(context).start_game,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Image.asset('assets/images/brain.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

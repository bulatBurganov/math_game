import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:math_game/common/widgets/bounce_button.dart';
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
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Text('Math game'),
            SizedBox(
              height: 50,
              child: BounceButton(
                onTap: () {
                  context.router.push(const MathGameRoute());
                },
                duration: const Duration(milliseconds: 200),
                child: Text('Start game'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

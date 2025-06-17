import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/text.dart';
import 'dart:math';

class GameOverOverlay extends StatelessWidget {
  final MathBubbleGame game;

  const GameOverOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Game Over!',
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            Text(
              'Final Score: ${game.score}',
              style: const TextStyle(fontSize: 36, color: Colors.white),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                game.resetGame();
                game.overlays.remove('GameOver');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                textStyle: const TextStyle(fontSize: 24),
              ),
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}

class MathBubbleGame extends FlameGame with TapDetector {
  int lives = 3;
  int score = 0;
  String currentCondition = ">5";
  late TextComponent conditionText;
  late TextComponent scoreText;
  late TextComponent livesText;

  final Random random = Random();
  final List<Bubble> activeBubbles = [];
  double spawnTimer = 0;
  double conditionTimer = 0;

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(resolution: Vector2(360, 640));

    // Инициализация UI
    conditionText = TextComponent(
      text: 'Condition: $currentCondition',
      position: Vector2(size.x / 2, 200),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    add(conditionText);

    scoreText = TextComponent(
      text: 'Score: $score',
      position: Vector2(80, 150),
      textRenderer: TextPaint(
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
    add(scoreText);

    livesText = TextComponent(
      text: 'Lives: $lives',
      position: Vector2(size.x - 80, 150),
      textRenderer: TextPaint(
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
    add(livesText);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Приостанавливаем игру, если GameOver активен
    if (overlays.isActive('GameOver')) return;

    // Генерация пузырей
    spawnTimer += dt;
    if (spawnTimer > 1.0) {
      spawnBubble();
      spawnTimer = 0;
    }

    // Смена условия
    conditionTimer += dt;
    if (conditionTimer > 10) {
      changeCondition();
      conditionTimer = 0;
    }

    // Обновление UI
    updateUI();
  }

  void spawnBubble() {
    final position = Vector2(random.nextDouble() * size.x, -50);

    if (random.nextDouble() < 0.7) {
      final value = random.nextInt(10) + 1;
      final bubble = NumberBubble(value, position);
      add(bubble);
      activeBubbles.add(bubble);
    } else if (random.nextBool() && lives != 3) {
      final live = LiveBubble(position);
      add(live);
      activeBubbles.add(live);
    } else {
      final equationType = ['>', '<', '='][random.nextInt(3)];
      final value = random.nextInt(8) + 2;
      final bubble = EquationBubble('$equationType$value', position);
      add(bubble);
      activeBubbles.add(bubble);
    }
  }

  void changeCondition() {
    final conditions = ['>5', '<3', '=8', '>2', '=10', '<7'];
    currentCondition = conditions[random.nextInt(conditions.length)];
    conditionText.text = 'Condition: $currentCondition';
  }

  @override
  void onTapDown(TapDownInfo info) {
    // print('ontapDown');
    // Не обрабатываем тапы, если игра окончена
    if (overlays.isActive('GameOver')) return;

    final tapPosition = info.eventPosition.global;

    for (final bubble in activeBubbles) {
      if (bubble.containsPoint(tapPosition)) {
        handleBubbleTap(bubble);
        break;
      }
    }
  }

  void handleBubbleTap(Bubble bubble) {
    print('tap $bubble');
    if (isConditionSatisfied(bubble)) {
      score += 10;
      bubble.pop();
    } else {
      lives--;
      if (lives <= 0) {
        print('game over');
        gameOver();
      }
    }
    activeBubbles.remove(bubble);
  }

  bool isConditionSatisfied(Bubble bubble) {
    if (bubble is NumberBubble) {
      return evaluateCondition(bubble.value);
    } else if (bubble is EquationBubble) {
      currentCondition = bubble.equation;
      conditionText.text = bubble.equation;
      return bubble.equation == currentCondition;
    } else if (bubble is LiveBubble) {
      print('live tapped');
      lives++;
      return true;
    }
    return false;
  }

  bool evaluateCondition(int value) {
    final operator = currentCondition[0];
    final conditionValue = int.parse(currentCondition.substring(1));

    switch (operator) {
      case '>':
        return value > conditionValue;
      case '<':
        return value < conditionValue;
      case '=':
        return value == conditionValue;
      default:
        return false;
    }
  }

  void updateUI() {
    scoreText.text = 'Score: $score';
    livesText.text = 'Lives: $lives';
  }

  void gameOver() {
    overlays.add('GameOver');
  }

  void resetGame() {
    lives = 3;
    score = 0;
    activeBubbles.clear();
    conditionTimer = 0;
    spawnTimer = 0;

    // Удаляем все пузыри
    children.whereType<Bubble>().forEach((bubble) {
      bubble.removeFromParent();
    });

    // Обновляем UI
    updateUI();
    changeCondition();
  }
}

abstract class Bubble extends PositionComponent
    with TapCallbacks, HasGameReference {
  final Vector2 velocity = Vector2(0, 100);

  Bubble(Vector2 position) : super(position: position, size: Vector2.all(60));

  void pop() {
    removeFromParent();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (position.y > game.size.y + 100) {
      removeFromParent();
      (game as MathBubbleGame).activeBubbles.remove(this);
    }
  }

  @override
  bool containsPoint(Vector2 point) {
    return position.distanceTo(point) <= size.x;
  }
}

class NumberBubble extends Bubble {
  final int value;

  NumberBubble(this.value, Vector2 position) : super(position);

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.x / 2, size.y / 2), size.x / 2, paint);

    final textPaint = TextPaint(
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );

    textPaint.render(
      canvas,
      value.toString(),
      Vector2(size.x / 2, size.y / 2),
      anchor: Anchor.center,
    );
  }
}

class EquationBubble extends Bubble {
  final String equation;

  EquationBubble(this.equation, Vector2 position) : super(position);

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.green.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.x / 2, size.y / 2), size.x / 2, paint);

    final textPaint = TextPaint(
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );

    textPaint.render(
      canvas,
      equation,
      Vector2(size.x / 2, size.y / 2),
      anchor: Anchor.center,
    );
  }
}

class LiveBubble extends Bubble {
  LiveBubble(super.position);

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.red[300]!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.x / 2, size.y / 2), size.x / 2, paint);
  }
}

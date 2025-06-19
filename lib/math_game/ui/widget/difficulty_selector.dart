import 'package:flutter/material.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';

class DifficultySelector extends StatefulWidget {
  const DifficultySelector({
    super.key,
    required this.onCahnged,
    this.swithDuration = const Duration(milliseconds: 500),
    this.height = 50,
    this.padding = 4,
  });
  final Duration swithDuration;
  final double height;
  final double padding;

  final Function(GameDifficulty difficulty) onCahnged;

  @override
  State<DifficultySelector> createState() => _DifficultySelectorState();
}

class _DifficultySelectorState extends State<DifficultySelector> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            constraints.maxWidth / GameDifficulty.values.length -
            widget.padding / 2;
        return Container(
          height: widget.height,
          padding: EdgeInsets.all(widget.padding),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                curve: Curves.easeInOutCubicEmphasized,
                duration: widget.swithDuration,
                left: itemWidth * _selectedIndex,
                child: Container(
                  width: itemWidth,
                  height: widget.height - widget.padding * 2,
                  decoration: BoxDecoration(
                    color: _getColorByDifficulty(
                      GameDifficulty.values[_selectedIndex],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  GameDifficulty.values.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _selectedIndex = index;
                        widget.onCahnged(GameDifficulty.values[index]);
                      }),
                      child: Container(
                        color: Colors.transparent,
                        height: widget.height - widget.padding * 2,
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          curve: Curves.easeInOutCubicEmphasized,
                          duration: widget.swithDuration,
                          style: TextStyle(
                            color: _selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                          child: Text(
                            key: ValueKey<String>(
                              GameDifficulty.values[index].name,
                            ),
                            textAlign: TextAlign.center,
                            GameDifficulty.values[index].name,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getColorByDifficulty(GameDifficulty difficulty) {
    return switch (difficulty) {
      GameDifficulty.easy => Colors.green,
      GameDifficulty.medium => Colors.yellowAccent[700]!,
      GameDifficulty.hard => Colors.red,
      GameDifficulty.genius => Colors.orangeAccent,
    };
  }
}

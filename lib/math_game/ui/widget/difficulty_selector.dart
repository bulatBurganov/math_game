import 'package:flutter/material.dart';
import 'package:math_game/common/widgets/app_checkbox.dart';
import 'package:math_game/common/widgets/expanded_section.dart';
import 'package:math_game/generated/l10n.dart';
import 'package:math_game/math_game/domain/bloc/game_settings_bloc/game_settings_state.dart';
import 'package:math_game/math_game/domain/model/game_settings_model.dart';
import 'package:math_game/math_game/ui/widget/form_text_field.dart';

class DifficultySelector extends StatefulWidget {
  const DifficultySelector({
    super.key,
    required this.onCahnged,
    this.swithDuration = const Duration(milliseconds: 500),
    this.height = 50,
    this.padding = 4,
    this.initialValue,
    required this.initialAdditionalSettings,
    required this.onAdditionalSettingsChanged,
  });
  final Duration swithDuration;
  final double height;
  final double padding;
  final GameDifficulty? initialValue;
  final Function(GameDifficulty difficulty) onCahnged;
  final GameAdditionalSettings initialAdditionalSettings;
  final Function(GameAdditionalSettings settings) onAdditionalSettingsChanged;

  @override
  State<DifficultySelector> createState() => _DifficultySelectorState();
}

class _DifficultySelectorState extends State<DifficultySelector> {
  int _selectedIndex = 0;

  @override
  void initState() {
    if (widget.initialValue != null) {
      _selectedIndex = GameDifficulty.values.indexOf(widget.initialValue!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            constraints.maxWidth / GameDifficulty.values.length -
            widget.padding / 2;
        return Column(
          children: [
            Container(
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
                                _getDifficultyName(
                                  GameDifficulty.values[index],
                                  context,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                SizedBox(
                  height: 50,
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.fastEaseInToSlowEaseOut,
                    duration: widget.swithDuration,
                    child: Text(
                      key: ValueKey(GameDifficulty.values[_selectedIndex]),
                      _getDifficultyDescription(
                        context,
                        GameDifficulty.values[_selectedIndex],
                      ),
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                ExpandedSection(
                  axis: Axis.vertical,
                  expand: _selectedIndex == 3,
                  child: Column(
                    children: [
                      AppCheckBox(
                        initialValue: widget.initialAdditionalSettings.usePlus,
                        onChange: (value) {
                          widget.onAdditionalSettingsChanged(
                            widget.initialAdditionalSettings.copyWith(
                              usePlus: value,
                            ),
                          );
                        },
                        title: S.of(context).useSomething('+'),
                      ),
                      const SizedBox(height: 4),
                      AppCheckBox(
                        initialValue: widget.initialAdditionalSettings.useMinus,
                        onChange: (value) {
                          widget.onAdditionalSettingsChanged(
                            widget.initialAdditionalSettings.copyWith(
                              useMinus: value,
                            ),
                          );
                        },
                        title: S.of(context).useSomething('-'),
                      ),
                      const SizedBox(height: 4),
                      AppCheckBox(
                        initialValue:
                            widget.initialAdditionalSettings.useMultiply,
                        onChange: (value) {
                          widget.onAdditionalSettingsChanged(
                            widget.initialAdditionalSettings.copyWith(
                              useMultiply: value,
                            ),
                          );
                        },
                        title: S.of(context).useSomething('*'),
                      ),
                      const SizedBox(height: 4),
                      AppCheckBox(
                        initialValue:
                            widget.initialAdditionalSettings.useDivide,
                        onChange: (value) {
                          widget.onAdditionalSettingsChanged(
                            widget.initialAdditionalSettings.copyWith(
                              useDivide: value,
                            ),
                          );
                        },
                        title: S.of(context).useSomething('/'),
                      ),
                      const SizedBox(height: 4),

                      FormTextField(
                        initialValue: widget
                            .initialAdditionalSettings
                            .termLength
                            .toString(),
                        onChanged: (v) {
                          if (v.isNotEmpty) {
                            widget.onAdditionalSettingsChanged(
                              widget.initialAdditionalSettings.copyWith(
                                termLength: int.parse(v),
                              ),
                            );
                          }
                        },
                        label: S.of(context).termLength,
                      ),
                      FormTextField(
                        initialValue: widget.initialAdditionalSettings.min
                            .toString(),
                        onChanged: (v) {
                          if (v.isNotEmpty) {
                            widget.onAdditionalSettingsChanged(
                              widget.initialAdditionalSettings.copyWith(
                                min: int.parse(v),
                              ),
                            );
                          }
                        },
                        label: S.of(context).minValue,
                      ),
                      FormTextField(
                        initialValue: widget.initialAdditionalSettings.max
                            .toString(),
                        onChanged: (v) {
                          if (v.isNotEmpty) {
                            widget.onAdditionalSettingsChanged(
                              widget.initialAdditionalSettings.copyWith(
                                max: int.parse(v),
                              ),
                            );
                          }
                        },
                        label: S.of(context).maxValue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
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

  String _getDifficultyName(GameDifficulty difficulty, BuildContext context) {
    return switch (difficulty) {
      GameDifficulty.easy => S.of(context).difficulty_easy,
      GameDifficulty.medium => S.of(context).difficulty_medium,
      GameDifficulty.hard => S.of(context).difficulty_hard,
      GameDifficulty.genius => S.of(context).difficulty_genius,
    };
  }

  String _getDifficultyDescription(
    BuildContext context,
    GameDifficulty difficulty,
  ) {
    return switch (difficulty) {
      GameDifficulty.easy => S.of(context).easyModeDescription,
      GameDifficulty.medium => S.of(context).mediumModeDescription,
      GameDifficulty.hard => S.of(context).hardModeDescription,
      GameDifficulty.genius => S.of(context).geniusModeDescription,
    };
  }
}

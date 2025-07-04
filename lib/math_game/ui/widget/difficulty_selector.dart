import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    required this.initialUserSettings,
    required this.onUserSettingsChanged,
    required this.onPresetChanged,
  });
  final Duration swithDuration;
  final double height;
  final double padding;
  final GameDifficulty? initialValue;
  final Function(GameDifficulty difficulty) onCahnged;
  final GameUserSettings initialUserSettings;
  final Function(GameUserSettings settings) onUserSettingsChanged;
  final Function(GamePresets?) onPresetChanged;

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
            Material(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(24),

              child: Container(
                height: widget.height,
                padding: EdgeInsets.all(widget.padding),
                decoration: BoxDecoration(color: Colors.grey[200]),
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
                                  color:
                                      (_selectedIndex == index &&
                                          _selectedIndex != 1)
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
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                SizedBox(
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
                const SizedBox(height: 8),
                ExpandedSection(
                  axis: Axis.vertical,
                  curve: Curves.easeInOutCubicEmphasized,
                  expand: _selectedIndex == 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _PresetSelector(
                        onChanged: widget.onPresetChanged,
                        value: widget.initialUserSettings.preset,
                      ),
                      AppCheckBox(
                        value: widget.initialUserSettings.usePlus,
                        onChange: (value) {
                          widget.onUserSettingsChanged(
                            widget.initialUserSettings.copyWith(usePlus: value),
                          );
                        },
                        title: S.of(context).useSomething('+'),
                      ),
                      const SizedBox(height: 4),
                      AppCheckBox(
                        value: widget.initialUserSettings.useMinus,
                        onChange: (value) {
                          widget.onUserSettingsChanged(
                            widget.initialUserSettings.copyWith(
                              useMinus: value,
                            ),
                          );
                        },
                        title: S.of(context).useSomething('-'),
                      ),
                      const SizedBox(height: 4),
                      AppCheckBox(
                        value: widget.initialUserSettings.useMultiply,
                        onChange: (value) {
                          widget.onUserSettingsChanged(
                            widget.initialUserSettings.copyWith(
                              useMultiply: value,
                            ),
                          );
                        },
                        title: S.of(context).useSomething('*'),
                      ),
                      const SizedBox(height: 4),
                      AppCheckBox(
                        value: widget.initialUserSettings.useDivide,
                        onChange: (value) {
                          widget.onUserSettingsChanged(
                            widget.initialUserSettings.copyWith(
                              useDivide: value,
                            ),
                          );
                        },
                        title: S.of(context).useSomething('/'),
                      ),
                      const SizedBox(height: 4),
                      AppCheckBox(
                        value: widget.initialUserSettings.onlyPositiveResults,
                        onChange: (value) {
                          widget.onUserSettingsChanged(
                            widget.initialUserSettings.copyWith(
                              onlyPositiveResults: value,
                            ),
                          );
                        },
                        title: S.of(context).answerIsAlwaysPositive,
                      ),
                      const SizedBox(height: 4),
                      FormTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[2-9]')),
                        ],
                        value: widget.initialUserSettings.termLength
                            ?.toString(),
                        onChanged: (v) {
                          widget.onUserSettingsChanged(
                            widget.initialUserSettings.copyWith(
                              termLength: int.tryParse(v),
                            ),
                          );
                        },
                        label: S.of(context).termLength,
                      ),
                      const SizedBox(height: 4),

                      FormTextField(
                        value: widget.initialUserSettings.min?.toString(),
                        onChanged: (v) {
                          widget.onUserSettingsChanged(
                            widget.initialUserSettings.copyWith(
                              min: int.tryParse(v),
                            ),
                          );
                        },
                        label: S.of(context).minValue,
                      ),
                      const SizedBox(height: 4),

                      FormTextField(
                        value: widget.initialUserSettings.max?.toString(),
                        onChanged: (v) {
                          widget.onUserSettingsChanged(
                            widget.initialUserSettings.copyWith(
                              max: int.tryParse(v),
                            ),
                          );
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
      GameDifficulty.user => Colors.orangeAccent,
    };
  }

  String _getDifficultyName(GameDifficulty difficulty, BuildContext context) {
    return switch (difficulty) {
      GameDifficulty.easy => S.of(context).difficulty_easy,
      GameDifficulty.medium => S.of(context).difficulty_medium,
      GameDifficulty.hard => S.of(context).difficulty_hard,
      GameDifficulty.user => S.of(context).difficulty_user,
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
      GameDifficulty.user => S.of(context).userModeDescription,
    };
  }
}

class _PresetSelector extends StatefulWidget {
  final Function(GamePresets? preset) onChanged;
  final GamePresets? value;

  const _PresetSelector({required this.onChanged, required this.value});
  @override
  State<_PresetSelector> createState() => _PresetSelectorState();
}

class _PresetSelectorState extends State<_PresetSelector> {
  GamePresets? selected;

  @override
  void didUpdateWidget(covariant _PresetSelector oldWidget) {
    if (widget.value != oldWidget.value) {
      setState(() {
        selected = widget.value;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<GamePresets>(
      borderRadius: BorderRadius.circular(12),
      underline: const Offstage(),
      value: selected,
      hint: Text(S.of(context).selectPreset),
      items: GamePresets.values
          .map(
            (e) => DropdownMenuItem<GamePresets>(
              value: e,
              child: Text(_getPresetName(e)),
            ),
          )
          .toList(),
      onChanged: (v) {
        setState(() {
          if (v == GamePresets.none) {
            v = null;
          }
          selected = v;

          widget.onChanged(v);
        });
      },
    );
  }

  String _getPresetName(GamePresets? preset) => switch (preset) {
    GamePresets.multiplicationTable => S.of(context).multiplicationTable,
    null => S.of(context).selectPreset,
    GamePresets.none => S.of(context).presetNotSelected,
  };
}

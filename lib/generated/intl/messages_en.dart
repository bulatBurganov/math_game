// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(somethis) => "Использовать ${somethis}";

  static String m1(n, plural) => "Вы заработали ${n} ${plural}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "answerIsAlwaysPositive": MessageLookupByLibrary.simpleMessage(
            "Решение всегда положительное число"),
        "app_name":
            MessageLookupByLibrary.simpleMessage("Математический\nтренажер"),
        "difficulty": MessageLookupByLibrary.simpleMessage("Сложность"),
        "difficulty_easy": MessageLookupByLibrary.simpleMessage("Легкая"),
        "difficulty_hard": MessageLookupByLibrary.simpleMessage("Сложная"),
        "difficulty_medium": MessageLookupByLibrary.simpleMessage("Средняя"),
        "difficulty_user": MessageLookupByLibrary.simpleMessage("Настроить"),
        "easyModeDescription": MessageLookupByLibrary.simpleMessage(
            "Сложение и вычиание 2 чисел в диапазоне от 1 до 10, результат всегда положительный"),
        "finish_game": MessageLookupByLibrary.simpleMessage("Завершить игру"),
        "game_over": MessageLookupByLibrary.simpleMessage("Игра завершена"),
        "hardModeDescription": MessageLookupByLibrary.simpleMessage(
            "Сложение, вычитание, умножение и деление 3 чисел в диапазоне от 1 до 10"),
        "lenMaxMinFieldsShoulBeFilled": MessageLookupByLibrary.simpleMessage(
            "Поля длины выражения, минимального и максимального значения должны быть заполнены"),
        "maxShouldBeLargerThanMin": MessageLookupByLibrary.simpleMessage(
            "Максимальное значение должно превышать минимальное"),
        "maxValue":
            MessageLookupByLibrary.simpleMessage("Максимальное значение"),
        "mediumModeDescription": MessageLookupByLibrary.simpleMessage(
            "Сложение, вычитание и умножение 2 чисел в диапазоне от 1 до 10"),
        "minValue":
            MessageLookupByLibrary.simpleMessage("Минимальное значение"),
        "multiplicationTablePreset":
            MessageLookupByLibrary.simpleMessage("Тренажер таблицы умножения"),
        "restart": MessageLookupByLibrary.simpleMessage("Сыграть снова"),
        "scoresFew": MessageLookupByLibrary.simpleMessage("очка"),
        "scoresMany": MessageLookupByLibrary.simpleMessage("очков"),
        "scoresOne": MessageLookupByLibrary.simpleMessage("очко"),
        "selectAtLeastOneOperator": MessageLookupByLibrary.simpleMessage(
            "Доложен быть выбран как минимум 1 оператор из числа +, -, *, /"),
        "start_game": MessageLookupByLibrary.simpleMessage("Начать игру"),
        "termLength": MessageLookupByLibrary.simpleMessage("Длина выражения"),
        "useSomething": m0,
        "userModeDescription": MessageLookupByLibrary.simpleMessage(
            "Настройте сложность самостоятельно"),
        "youEarnedNScores": m1
      };
}

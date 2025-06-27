// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Математический\nтренажер`
  String get app_name {
    return Intl.message(
      'Математический\nтренажер',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Начать игру`
  String get start_game {
    return Intl.message(
      'Начать игру',
      name: 'start_game',
      desc: '',
      args: [],
    );
  }

  /// `Завершить игру`
  String get finish_game {
    return Intl.message(
      'Завершить игру',
      name: 'finish_game',
      desc: '',
      args: [],
    );
  }

  /// `Игра завершена`
  String get game_over {
    return Intl.message(
      'Игра завершена',
      name: 'game_over',
      desc: '',
      args: [],
    );
  }

  /// `Легкая`
  String get difficulty_easy {
    return Intl.message(
      'Легкая',
      name: 'difficulty_easy',
      desc: '',
      args: [],
    );
  }

  /// `Средняя`
  String get difficulty_medium {
    return Intl.message(
      'Средняя',
      name: 'difficulty_medium',
      desc: '',
      args: [],
    );
  }

  /// `Сложная`
  String get difficulty_hard {
    return Intl.message(
      'Сложная',
      name: 'difficulty_hard',
      desc: '',
      args: [],
    );
  }

  /// `Настроить`
  String get difficulty_user {
    return Intl.message(
      'Настроить',
      name: 'difficulty_user',
      desc: '',
      args: [],
    );
  }

  /// `Сложность`
  String get difficulty {
    return Intl.message(
      'Сложность',
      name: 'difficulty',
      desc: '',
      args: [],
    );
  }

  /// `Сыграть снова`
  String get restart {
    return Intl.message(
      'Сыграть снова',
      name: 'restart',
      desc: '',
      args: [],
    );
  }

  /// `Вы заработали {n} {plural}`
  String youEarnedNScores(Object n, Object plural) {
    return Intl.message(
      'Вы заработали $n $plural',
      name: 'youEarnedNScores',
      desc: '',
      args: [n, plural],
    );
  }

  /// `очко`
  String get scoresOne {
    return Intl.message(
      'очко',
      name: 'scoresOne',
      desc: '',
      args: [],
    );
  }

  /// `очка`
  String get scoresFew {
    return Intl.message(
      'очка',
      name: 'scoresFew',
      desc: '',
      args: [],
    );
  }

  /// `очков`
  String get scoresMany {
    return Intl.message(
      'очков',
      name: 'scoresMany',
      desc: '',
      args: [],
    );
  }

  /// `Сложение и вычиание 2 чисел в диапазоне от 1 до 10, результат всегда положительный`
  String get easyModeDescription {
    return Intl.message(
      'Сложение и вычиание 2 чисел в диапазоне от 1 до 10, результат всегда положительный',
      name: 'easyModeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Сложение, вычитание и умножение 2 чисел в диапазоне от 1 до 10`
  String get mediumModeDescription {
    return Intl.message(
      'Сложение, вычитание и умножение 2 чисел в диапазоне от 1 до 10',
      name: 'mediumModeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Сложение, вычитание, умножение и деление 3 чисел в диапазоне от 1 до 10`
  String get hardModeDescription {
    return Intl.message(
      'Сложение, вычитание, умножение и деление 3 чисел в диапазоне от 1 до 10',
      name: 'hardModeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Настройте сложность самостоятельно`
  String get userModeDescription {
    return Intl.message(
      'Настройте сложность самостоятельно',
      name: 'userModeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Использовать {somethis}`
  String useSomething(Object somethis) {
    return Intl.message(
      'Использовать $somethis',
      name: 'useSomething',
      desc: '',
      args: [somethis],
    );
  }

  /// `Длина выражения`
  String get termLength {
    return Intl.message(
      'Длина выражения',
      name: 'termLength',
      desc: '',
      args: [],
    );
  }

  /// `Максимальное значение`
  String get maxValue {
    return Intl.message(
      'Максимальное значение',
      name: 'maxValue',
      desc: '',
      args: [],
    );
  }

  /// `Минимальное значение`
  String get minValue {
    return Intl.message(
      'Минимальное значение',
      name: 'minValue',
      desc: '',
      args: [],
    );
  }

  /// `Доложен быть выбран как минимум 1 оператор из числа +, -, *, /`
  String get selectAtLeastOneOperator {
    return Intl.message(
      'Доложен быть выбран как минимум 1 оператор из числа +, -, *, /',
      name: 'selectAtLeastOneOperator',
      desc: '',
      args: [],
    );
  }

  /// `Максимальное значение должно превышать минимальное`
  String get maxShouldBeLargerThanMin {
    return Intl.message(
      'Максимальное значение должно превышать минимальное',
      name: 'maxShouldBeLargerThanMin',
      desc: '',
      args: [],
    );
  }

  /// `Поля длины выражения, минимального и максимального значения должны быть заполнены`
  String get lenMaxMinFieldsShoulBeFilled {
    return Intl.message(
      'Поля длины выражения, минимального и максимального значения должны быть заполнены',
      name: 'lenMaxMinFieldsShoulBeFilled',
      desc: '',
      args: [],
    );
  }

  /// `Решение всегда положительное число`
  String get answerIsAlwaysPositive {
    return Intl.message(
      'Решение всегда положительное число',
      name: 'answerIsAlwaysPositive',
      desc: '',
      args: [],
    );
  }

  /// `Выберите пресет`
  String get selectPreset {
    return Intl.message(
      'Выберите пресет',
      name: 'selectPreset',
      desc: '',
      args: [],
    );
  }

  /// `Таблица умножения`
  String get multiplicationTable {
    return Intl.message(
      'Таблица умножения',
      name: 'multiplicationTable',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

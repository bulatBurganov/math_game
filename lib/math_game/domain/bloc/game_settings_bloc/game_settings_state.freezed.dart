// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GameSettingsState {
  GameDifficulty get difficulty => throw _privateConstructorUsedError;
  GameUserSettings get userSettings => throw _privateConstructorUsedError;

  /// Create a copy of GameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameSettingsStateCopyWith<GameSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSettingsStateCopyWith<$Res> {
  factory $GameSettingsStateCopyWith(
    GameSettingsState value,
    $Res Function(GameSettingsState) then,
  ) = _$GameSettingsStateCopyWithImpl<$Res, GameSettingsState>;
  @useResult
  $Res call({GameDifficulty difficulty, GameUserSettings userSettings});

  $GameUserSettingsCopyWith<$Res> get userSettings;
}

/// @nodoc
class _$GameSettingsStateCopyWithImpl<$Res, $Val extends GameSettingsState>
    implements $GameSettingsStateCopyWith<$Res> {
  _$GameSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? difficulty = null, Object? userSettings = null}) {
    return _then(
      _value.copyWith(
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as GameDifficulty,
            userSettings: null == userSettings
                ? _value.userSettings
                : userSettings // ignore: cast_nullable_to_non_nullable
                      as GameUserSettings,
          )
          as $Val,
    );
  }

  /// Create a copy of GameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameUserSettingsCopyWith<$Res> get userSettings {
    return $GameUserSettingsCopyWith<$Res>(_value.userSettings, (value) {
      return _then(_value.copyWith(userSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameSettingsStateImplCopyWith<$Res>
    implements $GameSettingsStateCopyWith<$Res> {
  factory _$$GameSettingsStateImplCopyWith(
    _$GameSettingsStateImpl value,
    $Res Function(_$GameSettingsStateImpl) then,
  ) = __$$GameSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameDifficulty difficulty, GameUserSettings userSettings});

  @override
  $GameUserSettingsCopyWith<$Res> get userSettings;
}

/// @nodoc
class __$$GameSettingsStateImplCopyWithImpl<$Res>
    extends _$GameSettingsStateCopyWithImpl<$Res, _$GameSettingsStateImpl>
    implements _$$GameSettingsStateImplCopyWith<$Res> {
  __$$GameSettingsStateImplCopyWithImpl(
    _$GameSettingsStateImpl _value,
    $Res Function(_$GameSettingsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? difficulty = null, Object? userSettings = null}) {
    return _then(
      _$GameSettingsStateImpl(
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as GameDifficulty,
        userSettings: null == userSettings
            ? _value.userSettings
            : userSettings // ignore: cast_nullable_to_non_nullable
                  as GameUserSettings,
      ),
    );
  }
}

/// @nodoc

class _$GameSettingsStateImpl implements _GameSettingsState {
  _$GameSettingsStateImpl({
    this.difficulty = GameDifficulty.easy,
    this.userSettings = const GameUserSettings(),
  });

  @override
  @JsonKey()
  final GameDifficulty difficulty;
  @override
  @JsonKey()
  final GameUserSettings userSettings;

  @override
  String toString() {
    return 'GameSettingsState(difficulty: $difficulty, userSettings: $userSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSettingsStateImpl &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.userSettings, userSettings) ||
                other.userSettings == userSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, difficulty, userSettings);

  /// Create a copy of GameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSettingsStateImplCopyWith<_$GameSettingsStateImpl> get copyWith =>
      __$$GameSettingsStateImplCopyWithImpl<_$GameSettingsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _GameSettingsState implements GameSettingsState {
  factory _GameSettingsState({
    final GameDifficulty difficulty,
    final GameUserSettings userSettings,
  }) = _$GameSettingsStateImpl;

  @override
  GameDifficulty get difficulty;
  @override
  GameUserSettings get userSettings;

  /// Create a copy of GameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameSettingsStateImplCopyWith<_$GameSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameUserSettings {
  bool get usePlus => throw _privateConstructorUsedError;
  bool get useMinus => throw _privateConstructorUsedError;
  bool get useMultiply => throw _privateConstructorUsedError;
  bool get useDivide => throw _privateConstructorUsedError;
  int? get termLength => throw _privateConstructorUsedError;
  int? get min => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;
  ValidationErrors? get validationErrors => throw _privateConstructorUsedError;

  /// Create a copy of GameUserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameUserSettingsCopyWith<GameUserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameUserSettingsCopyWith<$Res> {
  factory $GameUserSettingsCopyWith(
    GameUserSettings value,
    $Res Function(GameUserSettings) then,
  ) = _$GameUserSettingsCopyWithImpl<$Res, GameUserSettings>;
  @useResult
  $Res call({
    bool usePlus,
    bool useMinus,
    bool useMultiply,
    bool useDivide,
    int? termLength,
    int? min,
    int? max,
    ValidationErrors? validationErrors,
  });
}

/// @nodoc
class _$GameUserSettingsCopyWithImpl<$Res, $Val extends GameUserSettings>
    implements $GameUserSettingsCopyWith<$Res> {
  _$GameUserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameUserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usePlus = null,
    Object? useMinus = null,
    Object? useMultiply = null,
    Object? useDivide = null,
    Object? termLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? validationErrors = freezed,
  }) {
    return _then(
      _value.copyWith(
            usePlus: null == usePlus
                ? _value.usePlus
                : usePlus // ignore: cast_nullable_to_non_nullable
                      as bool,
            useMinus: null == useMinus
                ? _value.useMinus
                : useMinus // ignore: cast_nullable_to_non_nullable
                      as bool,
            useMultiply: null == useMultiply
                ? _value.useMultiply
                : useMultiply // ignore: cast_nullable_to_non_nullable
                      as bool,
            useDivide: null == useDivide
                ? _value.useDivide
                : useDivide // ignore: cast_nullable_to_non_nullable
                      as bool,
            termLength: freezed == termLength
                ? _value.termLength
                : termLength // ignore: cast_nullable_to_non_nullable
                      as int?,
            min: freezed == min
                ? _value.min
                : min // ignore: cast_nullable_to_non_nullable
                      as int?,
            max: freezed == max
                ? _value.max
                : max // ignore: cast_nullable_to_non_nullable
                      as int?,
            validationErrors: freezed == validationErrors
                ? _value.validationErrors
                : validationErrors // ignore: cast_nullable_to_non_nullable
                      as ValidationErrors?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameAdditionalSettingsImplCopyWith<$Res>
    implements $GameUserSettingsCopyWith<$Res> {
  factory _$$GameAdditionalSettingsImplCopyWith(
    _$GameAdditionalSettingsImpl value,
    $Res Function(_$GameAdditionalSettingsImpl) then,
  ) = __$$GameAdditionalSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool usePlus,
    bool useMinus,
    bool useMultiply,
    bool useDivide,
    int? termLength,
    int? min,
    int? max,
    ValidationErrors? validationErrors,
  });
}

/// @nodoc
class __$$GameAdditionalSettingsImplCopyWithImpl<$Res>
    extends _$GameUserSettingsCopyWithImpl<$Res, _$GameAdditionalSettingsImpl>
    implements _$$GameAdditionalSettingsImplCopyWith<$Res> {
  __$$GameAdditionalSettingsImplCopyWithImpl(
    _$GameAdditionalSettingsImpl _value,
    $Res Function(_$GameAdditionalSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameUserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usePlus = null,
    Object? useMinus = null,
    Object? useMultiply = null,
    Object? useDivide = null,
    Object? termLength = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? validationErrors = freezed,
  }) {
    return _then(
      _$GameAdditionalSettingsImpl(
        usePlus: null == usePlus
            ? _value.usePlus
            : usePlus // ignore: cast_nullable_to_non_nullable
                  as bool,
        useMinus: null == useMinus
            ? _value.useMinus
            : useMinus // ignore: cast_nullable_to_non_nullable
                  as bool,
        useMultiply: null == useMultiply
            ? _value.useMultiply
            : useMultiply // ignore: cast_nullable_to_non_nullable
                  as bool,
        useDivide: null == useDivide
            ? _value.useDivide
            : useDivide // ignore: cast_nullable_to_non_nullable
                  as bool,
        termLength: freezed == termLength
            ? _value.termLength
            : termLength // ignore: cast_nullable_to_non_nullable
                  as int?,
        min: freezed == min
            ? _value.min
            : min // ignore: cast_nullable_to_non_nullable
                  as int?,
        max: freezed == max
            ? _value.max
            : max // ignore: cast_nullable_to_non_nullable
                  as int?,
        validationErrors: freezed == validationErrors
            ? _value.validationErrors
            : validationErrors // ignore: cast_nullable_to_non_nullable
                  as ValidationErrors?,
      ),
    );
  }
}

/// @nodoc

class _$GameAdditionalSettingsImpl implements _GameAdditionalSettings {
  const _$GameAdditionalSettingsImpl({
    this.usePlus = true,
    this.useMinus = true,
    this.useMultiply = false,
    this.useDivide = false,
    this.termLength = 2,
    this.min = 1,
    this.max = 10,
    this.validationErrors,
  });

  @override
  @JsonKey()
  final bool usePlus;
  @override
  @JsonKey()
  final bool useMinus;
  @override
  @JsonKey()
  final bool useMultiply;
  @override
  @JsonKey()
  final bool useDivide;
  @override
  @JsonKey()
  final int? termLength;
  @override
  @JsonKey()
  final int? min;
  @override
  @JsonKey()
  final int? max;
  @override
  final ValidationErrors? validationErrors;

  @override
  String toString() {
    return 'GameUserSettings(usePlus: $usePlus, useMinus: $useMinus, useMultiply: $useMultiply, useDivide: $useDivide, termLength: $termLength, min: $min, max: $max, validationErrors: $validationErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameAdditionalSettingsImpl &&
            (identical(other.usePlus, usePlus) || other.usePlus == usePlus) &&
            (identical(other.useMinus, useMinus) ||
                other.useMinus == useMinus) &&
            (identical(other.useMultiply, useMultiply) ||
                other.useMultiply == useMultiply) &&
            (identical(other.useDivide, useDivide) ||
                other.useDivide == useDivide) &&
            (identical(other.termLength, termLength) ||
                other.termLength == termLength) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.validationErrors, validationErrors) ||
                other.validationErrors == validationErrors));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    usePlus,
    useMinus,
    useMultiply,
    useDivide,
    termLength,
    min,
    max,
    validationErrors,
  );

  /// Create a copy of GameUserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameAdditionalSettingsImplCopyWith<_$GameAdditionalSettingsImpl>
  get copyWith =>
      __$$GameAdditionalSettingsImplCopyWithImpl<_$GameAdditionalSettingsImpl>(
        this,
        _$identity,
      );
}

abstract class _GameAdditionalSettings implements GameUserSettings {
  const factory _GameAdditionalSettings({
    final bool usePlus,
    final bool useMinus,
    final bool useMultiply,
    final bool useDivide,
    final int? termLength,
    final int? min,
    final int? max,
    final ValidationErrors? validationErrors,
  }) = _$GameAdditionalSettingsImpl;

  @override
  bool get usePlus;
  @override
  bool get useMinus;
  @override
  bool get useMultiply;
  @override
  bool get useDivide;
  @override
  int? get termLength;
  @override
  int? get min;
  @override
  int? get max;
  @override
  ValidationErrors? get validationErrors;

  /// Create a copy of GameUserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameAdditionalSettingsImplCopyWith<_$GameAdditionalSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

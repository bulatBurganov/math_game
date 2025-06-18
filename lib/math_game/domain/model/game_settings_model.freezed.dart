// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GameSettingsModel {
  Difficulty get level => throw _privateConstructorUsedError;
  bool get isMultiplicationEnabled => throw _privateConstructorUsedError;
  bool get isDivisionEnabled => throw _privateConstructorUsedError;

  /// Create a copy of GameSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameSettingsModelCopyWith<GameSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSettingsModelCopyWith<$Res> {
  factory $GameSettingsModelCopyWith(
    GameSettingsModel value,
    $Res Function(GameSettingsModel) then,
  ) = _$GameSettingsModelCopyWithImpl<$Res, GameSettingsModel>;
  @useResult
  $Res call({
    Difficulty level,
    bool isMultiplicationEnabled,
    bool isDivisionEnabled,
  });
}

/// @nodoc
class _$GameSettingsModelCopyWithImpl<$Res, $Val extends GameSettingsModel>
    implements $GameSettingsModelCopyWith<$Res> {
  _$GameSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? isMultiplicationEnabled = null,
    Object? isDivisionEnabled = null,
  }) {
    return _then(
      _value.copyWith(
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as Difficulty,
            isMultiplicationEnabled: null == isMultiplicationEnabled
                ? _value.isMultiplicationEnabled
                : isMultiplicationEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDivisionEnabled: null == isDivisionEnabled
                ? _value.isDivisionEnabled
                : isDivisionEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameSettingsModelImplCopyWith<$Res>
    implements $GameSettingsModelCopyWith<$Res> {
  factory _$$GameSettingsModelImplCopyWith(
    _$GameSettingsModelImpl value,
    $Res Function(_$GameSettingsModelImpl) then,
  ) = __$$GameSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Difficulty level,
    bool isMultiplicationEnabled,
    bool isDivisionEnabled,
  });
}

/// @nodoc
class __$$GameSettingsModelImplCopyWithImpl<$Res>
    extends _$GameSettingsModelCopyWithImpl<$Res, _$GameSettingsModelImpl>
    implements _$$GameSettingsModelImplCopyWith<$Res> {
  __$$GameSettingsModelImplCopyWithImpl(
    _$GameSettingsModelImpl _value,
    $Res Function(_$GameSettingsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? isMultiplicationEnabled = null,
    Object? isDivisionEnabled = null,
  }) {
    return _then(
      _$GameSettingsModelImpl(
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as Difficulty,
        isMultiplicationEnabled: null == isMultiplicationEnabled
            ? _value.isMultiplicationEnabled
            : isMultiplicationEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDivisionEnabled: null == isDivisionEnabled
            ? _value.isDivisionEnabled
            : isDivisionEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$GameSettingsModelImpl implements _GameSettingsModel {
  _$GameSettingsModelImpl({
    this.level = Difficulty.easy,
    this.isMultiplicationEnabled = false,
    this.isDivisionEnabled = false,
  });

  @override
  @JsonKey()
  final Difficulty level;
  @override
  @JsonKey()
  final bool isMultiplicationEnabled;
  @override
  @JsonKey()
  final bool isDivisionEnabled;

  @override
  String toString() {
    return 'GameSettingsModel(level: $level, isMultiplicationEnabled: $isMultiplicationEnabled, isDivisionEnabled: $isDivisionEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSettingsModelImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(
                  other.isMultiplicationEnabled,
                  isMultiplicationEnabled,
                ) ||
                other.isMultiplicationEnabled == isMultiplicationEnabled) &&
            (identical(other.isDivisionEnabled, isDivisionEnabled) ||
                other.isDivisionEnabled == isDivisionEnabled));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    level,
    isMultiplicationEnabled,
    isDivisionEnabled,
  );

  /// Create a copy of GameSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSettingsModelImplCopyWith<_$GameSettingsModelImpl> get copyWith =>
      __$$GameSettingsModelImplCopyWithImpl<_$GameSettingsModelImpl>(
        this,
        _$identity,
      );
}

abstract class _GameSettingsModel implements GameSettingsModel {
  factory _GameSettingsModel({
    final Difficulty level,
    final bool isMultiplicationEnabled,
    final bool isDivisionEnabled,
  }) = _$GameSettingsModelImpl;

  @override
  Difficulty get level;
  @override
  bool get isMultiplicationEnabled;
  @override
  bool get isDivisionEnabled;

  /// Create a copy of GameSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameSettingsModelImplCopyWith<_$GameSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  $Res call({GameDifficulty difficulty});
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
  $Res call({Object? difficulty = freezed}) {
    return _then(
      _value.copyWith(
            difficulty: freezed == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as GameDifficulty,
          )
          as $Val,
    );
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
  $Res call({GameDifficulty difficulty});
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
  $Res call({Object? difficulty = freezed}) {
    return _then(
      _$GameSettingsStateImpl(
        difficulty: freezed == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as GameDifficulty,
      ),
    );
  }
}

/// @nodoc

class _$GameSettingsStateImpl implements _GameSettingsState {
  _$GameSettingsStateImpl({this.difficulty = GameDifficulty.easy});

  @override
  @JsonKey()
  final GameDifficulty difficulty;

  @override
  String toString() {
    return 'GameSettingsState(difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSettingsStateImpl &&
            const DeepCollectionEquality().equals(
              other.difficulty,
              difficulty,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(difficulty));

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
  factory _GameSettingsState({final GameDifficulty difficulty}) =
      _$GameSettingsStateImpl;

  @override
  GameDifficulty get difficulty;

  /// Create a copy of GameSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameSettingsStateImplCopyWith<_$GameSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

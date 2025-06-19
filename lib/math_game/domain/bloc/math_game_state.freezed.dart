// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'math_game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MathGameState {
  List<ProblemModel> get levelModel => throw _privateConstructorUsedError;
  int get scores => throw _privateConstructorUsedError;
  int get lives => throw _privateConstructorUsedError;
  Duration get timer => throw _privateConstructorUsedError;

  /// Create a copy of MathGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MathGameStateCopyWith<MathGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MathGameStateCopyWith<$Res> {
  factory $MathGameStateCopyWith(
    MathGameState value,
    $Res Function(MathGameState) then,
  ) = _$MathGameStateCopyWithImpl<$Res, MathGameState>;
  @useResult
  $Res call({
    List<ProblemModel> levelModel,
    int scores,
    int lives,
    Duration timer,
  });
}

/// @nodoc
class _$MathGameStateCopyWithImpl<$Res, $Val extends MathGameState>
    implements $MathGameStateCopyWith<$Res> {
  _$MathGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MathGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelModel = null,
    Object? scores = null,
    Object? lives = null,
    Object? timer = null,
  }) {
    return _then(
      _value.copyWith(
            levelModel: null == levelModel
                ? _value.levelModel
                : levelModel // ignore: cast_nullable_to_non_nullable
                      as List<ProblemModel>,
            scores: null == scores
                ? _value.scores
                : scores // ignore: cast_nullable_to_non_nullable
                      as int,
            lives: null == lives
                ? _value.lives
                : lives // ignore: cast_nullable_to_non_nullable
                      as int,
            timer: null == timer
                ? _value.timer
                : timer // ignore: cast_nullable_to_non_nullable
                      as Duration,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MathGameStateImplCopyWith<$Res>
    implements $MathGameStateCopyWith<$Res> {
  factory _$$MathGameStateImplCopyWith(
    _$MathGameStateImpl value,
    $Res Function(_$MathGameStateImpl) then,
  ) = __$$MathGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ProblemModel> levelModel,
    int scores,
    int lives,
    Duration timer,
  });
}

/// @nodoc
class __$$MathGameStateImplCopyWithImpl<$Res>
    extends _$MathGameStateCopyWithImpl<$Res, _$MathGameStateImpl>
    implements _$$MathGameStateImplCopyWith<$Res> {
  __$$MathGameStateImplCopyWithImpl(
    _$MathGameStateImpl _value,
    $Res Function(_$MathGameStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MathGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelModel = null,
    Object? scores = null,
    Object? lives = null,
    Object? timer = null,
  }) {
    return _then(
      _$MathGameStateImpl(
        levelModel: null == levelModel
            ? _value._levelModel
            : levelModel // ignore: cast_nullable_to_non_nullable
                  as List<ProblemModel>,
        scores: null == scores
            ? _value.scores
            : scores // ignore: cast_nullable_to_non_nullable
                  as int,
        lives: null == lives
            ? _value.lives
            : lives // ignore: cast_nullable_to_non_nullable
                  as int,
        timer: null == timer
            ? _value.timer
            : timer // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$MathGameStateImpl implements _MathGameState {
  _$MathGameStateImpl({
    final List<ProblemModel> levelModel = const <ProblemModel>[],
    this.scores = 0,
    this.lives = defaultLivesCount,
    this.timer = const Duration(seconds: 0),
  }) : _levelModel = levelModel;

  final List<ProblemModel> _levelModel;
  @override
  @JsonKey()
  List<ProblemModel> get levelModel {
    if (_levelModel is EqualUnmodifiableListView) return _levelModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_levelModel);
  }

  @override
  @JsonKey()
  final int scores;
  @override
  @JsonKey()
  final int lives;
  @override
  @JsonKey()
  final Duration timer;

  @override
  String toString() {
    return 'MathGameState(levelModel: $levelModel, scores: $scores, lives: $lives, timer: $timer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MathGameStateImpl &&
            const DeepCollectionEquality().equals(
              other._levelModel,
              _levelModel,
            ) &&
            (identical(other.scores, scores) || other.scores == scores) &&
            (identical(other.lives, lives) || other.lives == lives) &&
            (identical(other.timer, timer) || other.timer == timer));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_levelModel),
    scores,
    lives,
    timer,
  );

  /// Create a copy of MathGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MathGameStateImplCopyWith<_$MathGameStateImpl> get copyWith =>
      __$$MathGameStateImplCopyWithImpl<_$MathGameStateImpl>(this, _$identity);
}

abstract class _MathGameState implements MathGameState {
  factory _MathGameState({
    final List<ProblemModel> levelModel,
    final int scores,
    final int lives,
    final Duration timer,
  }) = _$MathGameStateImpl;

  @override
  List<ProblemModel> get levelModel;
  @override
  int get scores;
  @override
  int get lives;
  @override
  Duration get timer;

  /// Create a copy of MathGameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MathGameStateImplCopyWith<_$MathGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GameFlowState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showSettings,
    required TResult Function() startGame,
    required TResult Function() finishGame,
    required TResult Function(int scores) gameOver,
    required TResult Function() restartGame,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showSettings,
    TResult? Function()? startGame,
    TResult? Function()? finishGame,
    TResult? Function(int scores)? gameOver,
    TResult? Function()? restartGame,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showSettings,
    TResult Function()? startGame,
    TResult Function()? finishGame,
    TResult Function(int scores)? gameOver,
    TResult Function()? restartGame,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameFlowStateShowSettings value) showSettings,
    required TResult Function(GameFlowStateStartGame value) startGame,
    required TResult Function(GameFlowStateFinishGame value) finishGame,
    required TResult Function(GameFlowStateGameOver value) gameOver,
    required TResult Function(GameFlowStateRestartGame value) restartGame,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameFlowStateShowSettings value)? showSettings,
    TResult? Function(GameFlowStateStartGame value)? startGame,
    TResult? Function(GameFlowStateFinishGame value)? finishGame,
    TResult? Function(GameFlowStateGameOver value)? gameOver,
    TResult? Function(GameFlowStateRestartGame value)? restartGame,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameFlowStateShowSettings value)? showSettings,
    TResult Function(GameFlowStateStartGame value)? startGame,
    TResult Function(GameFlowStateFinishGame value)? finishGame,
    TResult Function(GameFlowStateGameOver value)? gameOver,
    TResult Function(GameFlowStateRestartGame value)? restartGame,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameFlowStateCopyWith<$Res> {
  factory $GameFlowStateCopyWith(
    GameFlowState value,
    $Res Function(GameFlowState) then,
  ) = _$GameFlowStateCopyWithImpl<$Res, GameFlowState>;
}

/// @nodoc
class _$GameFlowStateCopyWithImpl<$Res, $Val extends GameFlowState>
    implements $GameFlowStateCopyWith<$Res> {
  _$GameFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GameFlowStateShowSettingsImplCopyWith<$Res> {
  factory _$$GameFlowStateShowSettingsImplCopyWith(
    _$GameFlowStateShowSettingsImpl value,
    $Res Function(_$GameFlowStateShowSettingsImpl) then,
  ) = __$$GameFlowStateShowSettingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameFlowStateShowSettingsImplCopyWithImpl<$Res>
    extends _$GameFlowStateCopyWithImpl<$Res, _$GameFlowStateShowSettingsImpl>
    implements _$$GameFlowStateShowSettingsImplCopyWith<$Res> {
  __$$GameFlowStateShowSettingsImplCopyWithImpl(
    _$GameFlowStateShowSettingsImpl _value,
    $Res Function(_$GameFlowStateShowSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GameFlowStateShowSettingsImpl implements GameFlowStateShowSettings {
  const _$GameFlowStateShowSettingsImpl();

  @override
  String toString() {
    return 'GameFlowState.showSettings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameFlowStateShowSettingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showSettings,
    required TResult Function() startGame,
    required TResult Function() finishGame,
    required TResult Function(int scores) gameOver,
    required TResult Function() restartGame,
  }) {
    return showSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showSettings,
    TResult? Function()? startGame,
    TResult? Function()? finishGame,
    TResult? Function(int scores)? gameOver,
    TResult? Function()? restartGame,
  }) {
    return showSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showSettings,
    TResult Function()? startGame,
    TResult Function()? finishGame,
    TResult Function(int scores)? gameOver,
    TResult Function()? restartGame,
    required TResult orElse(),
  }) {
    if (showSettings != null) {
      return showSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameFlowStateShowSettings value) showSettings,
    required TResult Function(GameFlowStateStartGame value) startGame,
    required TResult Function(GameFlowStateFinishGame value) finishGame,
    required TResult Function(GameFlowStateGameOver value) gameOver,
    required TResult Function(GameFlowStateRestartGame value) restartGame,
  }) {
    return showSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameFlowStateShowSettings value)? showSettings,
    TResult? Function(GameFlowStateStartGame value)? startGame,
    TResult? Function(GameFlowStateFinishGame value)? finishGame,
    TResult? Function(GameFlowStateGameOver value)? gameOver,
    TResult? Function(GameFlowStateRestartGame value)? restartGame,
  }) {
    return showSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameFlowStateShowSettings value)? showSettings,
    TResult Function(GameFlowStateStartGame value)? startGame,
    TResult Function(GameFlowStateFinishGame value)? finishGame,
    TResult Function(GameFlowStateGameOver value)? gameOver,
    TResult Function(GameFlowStateRestartGame value)? restartGame,
    required TResult orElse(),
  }) {
    if (showSettings != null) {
      return showSettings(this);
    }
    return orElse();
  }
}

abstract class GameFlowStateShowSettings implements GameFlowState {
  const factory GameFlowStateShowSettings() = _$GameFlowStateShowSettingsImpl;
}

/// @nodoc
abstract class _$$GameFlowStateStartGameImplCopyWith<$Res> {
  factory _$$GameFlowStateStartGameImplCopyWith(
    _$GameFlowStateStartGameImpl value,
    $Res Function(_$GameFlowStateStartGameImpl) then,
  ) = __$$GameFlowStateStartGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameFlowStateStartGameImplCopyWithImpl<$Res>
    extends _$GameFlowStateCopyWithImpl<$Res, _$GameFlowStateStartGameImpl>
    implements _$$GameFlowStateStartGameImplCopyWith<$Res> {
  __$$GameFlowStateStartGameImplCopyWithImpl(
    _$GameFlowStateStartGameImpl _value,
    $Res Function(_$GameFlowStateStartGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GameFlowStateStartGameImpl implements GameFlowStateStartGame {
  const _$GameFlowStateStartGameImpl();

  @override
  String toString() {
    return 'GameFlowState.startGame()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameFlowStateStartGameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showSettings,
    required TResult Function() startGame,
    required TResult Function() finishGame,
    required TResult Function(int scores) gameOver,
    required TResult Function() restartGame,
  }) {
    return startGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showSettings,
    TResult? Function()? startGame,
    TResult? Function()? finishGame,
    TResult? Function(int scores)? gameOver,
    TResult? Function()? restartGame,
  }) {
    return startGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showSettings,
    TResult Function()? startGame,
    TResult Function()? finishGame,
    TResult Function(int scores)? gameOver,
    TResult Function()? restartGame,
    required TResult orElse(),
  }) {
    if (startGame != null) {
      return startGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameFlowStateShowSettings value) showSettings,
    required TResult Function(GameFlowStateStartGame value) startGame,
    required TResult Function(GameFlowStateFinishGame value) finishGame,
    required TResult Function(GameFlowStateGameOver value) gameOver,
    required TResult Function(GameFlowStateRestartGame value) restartGame,
  }) {
    return startGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameFlowStateShowSettings value)? showSettings,
    TResult? Function(GameFlowStateStartGame value)? startGame,
    TResult? Function(GameFlowStateFinishGame value)? finishGame,
    TResult? Function(GameFlowStateGameOver value)? gameOver,
    TResult? Function(GameFlowStateRestartGame value)? restartGame,
  }) {
    return startGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameFlowStateShowSettings value)? showSettings,
    TResult Function(GameFlowStateStartGame value)? startGame,
    TResult Function(GameFlowStateFinishGame value)? finishGame,
    TResult Function(GameFlowStateGameOver value)? gameOver,
    TResult Function(GameFlowStateRestartGame value)? restartGame,
    required TResult orElse(),
  }) {
    if (startGame != null) {
      return startGame(this);
    }
    return orElse();
  }
}

abstract class GameFlowStateStartGame implements GameFlowState {
  const factory GameFlowStateStartGame() = _$GameFlowStateStartGameImpl;
}

/// @nodoc
abstract class _$$GameFlowStateFinishGameImplCopyWith<$Res> {
  factory _$$GameFlowStateFinishGameImplCopyWith(
    _$GameFlowStateFinishGameImpl value,
    $Res Function(_$GameFlowStateFinishGameImpl) then,
  ) = __$$GameFlowStateFinishGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameFlowStateFinishGameImplCopyWithImpl<$Res>
    extends _$GameFlowStateCopyWithImpl<$Res, _$GameFlowStateFinishGameImpl>
    implements _$$GameFlowStateFinishGameImplCopyWith<$Res> {
  __$$GameFlowStateFinishGameImplCopyWithImpl(
    _$GameFlowStateFinishGameImpl _value,
    $Res Function(_$GameFlowStateFinishGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GameFlowStateFinishGameImpl implements GameFlowStateFinishGame {
  const _$GameFlowStateFinishGameImpl();

  @override
  String toString() {
    return 'GameFlowState.finishGame()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameFlowStateFinishGameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showSettings,
    required TResult Function() startGame,
    required TResult Function() finishGame,
    required TResult Function(int scores) gameOver,
    required TResult Function() restartGame,
  }) {
    return finishGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showSettings,
    TResult? Function()? startGame,
    TResult? Function()? finishGame,
    TResult? Function(int scores)? gameOver,
    TResult? Function()? restartGame,
  }) {
    return finishGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showSettings,
    TResult Function()? startGame,
    TResult Function()? finishGame,
    TResult Function(int scores)? gameOver,
    TResult Function()? restartGame,
    required TResult orElse(),
  }) {
    if (finishGame != null) {
      return finishGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameFlowStateShowSettings value) showSettings,
    required TResult Function(GameFlowStateStartGame value) startGame,
    required TResult Function(GameFlowStateFinishGame value) finishGame,
    required TResult Function(GameFlowStateGameOver value) gameOver,
    required TResult Function(GameFlowStateRestartGame value) restartGame,
  }) {
    return finishGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameFlowStateShowSettings value)? showSettings,
    TResult? Function(GameFlowStateStartGame value)? startGame,
    TResult? Function(GameFlowStateFinishGame value)? finishGame,
    TResult? Function(GameFlowStateGameOver value)? gameOver,
    TResult? Function(GameFlowStateRestartGame value)? restartGame,
  }) {
    return finishGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameFlowStateShowSettings value)? showSettings,
    TResult Function(GameFlowStateStartGame value)? startGame,
    TResult Function(GameFlowStateFinishGame value)? finishGame,
    TResult Function(GameFlowStateGameOver value)? gameOver,
    TResult Function(GameFlowStateRestartGame value)? restartGame,
    required TResult orElse(),
  }) {
    if (finishGame != null) {
      return finishGame(this);
    }
    return orElse();
  }
}

abstract class GameFlowStateFinishGame implements GameFlowState {
  const factory GameFlowStateFinishGame() = _$GameFlowStateFinishGameImpl;
}

/// @nodoc
abstract class _$$GameFlowStateGameOverImplCopyWith<$Res> {
  factory _$$GameFlowStateGameOverImplCopyWith(
    _$GameFlowStateGameOverImpl value,
    $Res Function(_$GameFlowStateGameOverImpl) then,
  ) = __$$GameFlowStateGameOverImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int scores});
}

/// @nodoc
class __$$GameFlowStateGameOverImplCopyWithImpl<$Res>
    extends _$GameFlowStateCopyWithImpl<$Res, _$GameFlowStateGameOverImpl>
    implements _$$GameFlowStateGameOverImplCopyWith<$Res> {
  __$$GameFlowStateGameOverImplCopyWithImpl(
    _$GameFlowStateGameOverImpl _value,
    $Res Function(_$GameFlowStateGameOverImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? scores = null}) {
    return _then(
      _$GameFlowStateGameOverImpl(
        null == scores
            ? _value.scores
            : scores // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GameFlowStateGameOverImpl implements GameFlowStateGameOver {
  const _$GameFlowStateGameOverImpl(this.scores);

  @override
  final int scores;

  @override
  String toString() {
    return 'GameFlowState.gameOver(scores: $scores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameFlowStateGameOverImpl &&
            (identical(other.scores, scores) || other.scores == scores));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scores);

  /// Create a copy of GameFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameFlowStateGameOverImplCopyWith<_$GameFlowStateGameOverImpl>
  get copyWith =>
      __$$GameFlowStateGameOverImplCopyWithImpl<_$GameFlowStateGameOverImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showSettings,
    required TResult Function() startGame,
    required TResult Function() finishGame,
    required TResult Function(int scores) gameOver,
    required TResult Function() restartGame,
  }) {
    return gameOver(scores);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showSettings,
    TResult? Function()? startGame,
    TResult? Function()? finishGame,
    TResult? Function(int scores)? gameOver,
    TResult? Function()? restartGame,
  }) {
    return gameOver?.call(scores);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showSettings,
    TResult Function()? startGame,
    TResult Function()? finishGame,
    TResult Function(int scores)? gameOver,
    TResult Function()? restartGame,
    required TResult orElse(),
  }) {
    if (gameOver != null) {
      return gameOver(scores);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameFlowStateShowSettings value) showSettings,
    required TResult Function(GameFlowStateStartGame value) startGame,
    required TResult Function(GameFlowStateFinishGame value) finishGame,
    required TResult Function(GameFlowStateGameOver value) gameOver,
    required TResult Function(GameFlowStateRestartGame value) restartGame,
  }) {
    return gameOver(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameFlowStateShowSettings value)? showSettings,
    TResult? Function(GameFlowStateStartGame value)? startGame,
    TResult? Function(GameFlowStateFinishGame value)? finishGame,
    TResult? Function(GameFlowStateGameOver value)? gameOver,
    TResult? Function(GameFlowStateRestartGame value)? restartGame,
  }) {
    return gameOver?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameFlowStateShowSettings value)? showSettings,
    TResult Function(GameFlowStateStartGame value)? startGame,
    TResult Function(GameFlowStateFinishGame value)? finishGame,
    TResult Function(GameFlowStateGameOver value)? gameOver,
    TResult Function(GameFlowStateRestartGame value)? restartGame,
    required TResult orElse(),
  }) {
    if (gameOver != null) {
      return gameOver(this);
    }
    return orElse();
  }
}

abstract class GameFlowStateGameOver implements GameFlowState {
  const factory GameFlowStateGameOver(final int scores) =
      _$GameFlowStateGameOverImpl;

  int get scores;

  /// Create a copy of GameFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameFlowStateGameOverImplCopyWith<_$GameFlowStateGameOverImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameFlowStateRestartGameImplCopyWith<$Res> {
  factory _$$GameFlowStateRestartGameImplCopyWith(
    _$GameFlowStateRestartGameImpl value,
    $Res Function(_$GameFlowStateRestartGameImpl) then,
  ) = __$$GameFlowStateRestartGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameFlowStateRestartGameImplCopyWithImpl<$Res>
    extends _$GameFlowStateCopyWithImpl<$Res, _$GameFlowStateRestartGameImpl>
    implements _$$GameFlowStateRestartGameImplCopyWith<$Res> {
  __$$GameFlowStateRestartGameImplCopyWithImpl(
    _$GameFlowStateRestartGameImpl _value,
    $Res Function(_$GameFlowStateRestartGameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameFlowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GameFlowStateRestartGameImpl implements GameFlowStateRestartGame {
  const _$GameFlowStateRestartGameImpl();

  @override
  String toString() {
    return 'GameFlowState.restartGame()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameFlowStateRestartGameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showSettings,
    required TResult Function() startGame,
    required TResult Function() finishGame,
    required TResult Function(int scores) gameOver,
    required TResult Function() restartGame,
  }) {
    return restartGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showSettings,
    TResult? Function()? startGame,
    TResult? Function()? finishGame,
    TResult? Function(int scores)? gameOver,
    TResult? Function()? restartGame,
  }) {
    return restartGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showSettings,
    TResult Function()? startGame,
    TResult Function()? finishGame,
    TResult Function(int scores)? gameOver,
    TResult Function()? restartGame,
    required TResult orElse(),
  }) {
    if (restartGame != null) {
      return restartGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameFlowStateShowSettings value) showSettings,
    required TResult Function(GameFlowStateStartGame value) startGame,
    required TResult Function(GameFlowStateFinishGame value) finishGame,
    required TResult Function(GameFlowStateGameOver value) gameOver,
    required TResult Function(GameFlowStateRestartGame value) restartGame,
  }) {
    return restartGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameFlowStateShowSettings value)? showSettings,
    TResult? Function(GameFlowStateStartGame value)? startGame,
    TResult? Function(GameFlowStateFinishGame value)? finishGame,
    TResult? Function(GameFlowStateGameOver value)? gameOver,
    TResult? Function(GameFlowStateRestartGame value)? restartGame,
  }) {
    return restartGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameFlowStateShowSettings value)? showSettings,
    TResult Function(GameFlowStateStartGame value)? startGame,
    TResult Function(GameFlowStateFinishGame value)? finishGame,
    TResult Function(GameFlowStateGameOver value)? gameOver,
    TResult Function(GameFlowStateRestartGame value)? restartGame,
    required TResult orElse(),
  }) {
    if (restartGame != null) {
      return restartGame(this);
    }
    return orElse();
  }
}

abstract class GameFlowStateRestartGame implements GameFlowState {
  const factory GameFlowStateRestartGame() = _$GameFlowStateRestartGameImpl;
}

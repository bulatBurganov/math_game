import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_state.dart';

class GameFlowBloc extends Bloc<GameFlowEvent, GameFlowState> {
  GameFlowBloc() : super(const GameFlowStateShowSettings()) {
    on<GameFlowEventShowSettings>(_showSettings);
    on<GameFlowEventStartGame>(_startGame);
    on<GameFlowEventFinishGame>(_finshGame);
  }

  FutureOr<void> _showSettings(
    GameFlowEventShowSettings event,
    Emitter<GameFlowState> emit,
  ) {
    emit(const GameFlowStateShowSettings());
  }

  FutureOr<void> _startGame(
    GameFlowEventStartGame event,
    Emitter<GameFlowState> emit,
  ) {
    emit(const GameFlowStateStartGame());
  }

  FutureOr<void> _finshGame(
    GameFlowEventFinishGame event,
    Emitter<GameFlowState> emit,
  ) {
    emit(const GameFlowStateFinishGame());
  }
}

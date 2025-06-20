import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_state.dart';

class GameFlowBloc extends Bloc<GameFlowEvent, GameFlowState> {
  GameFlowBloc() : super(const GameFlowStateShowSettings()) {
    on<GameFlowEventShowSettings>(
      (event, emit) => emit(const GameFlowStateShowSettings()),
    );
    on<GameFlowEventStartGame>(
      (event, emit) => emit(const GameFlowStateStartGame()),
    );
    on<GameFlowEventFinishGame>(
      (event, emit) => emit(const GameFlowStateFinishGame()),
    );
    on<GameFlowEventGameOver>(
      (event, emit) => emit(GameFlowStateGameOver(event.scores)),
    );
    on<GameFlowEventRestartGame>(
      (event, emit) => emit(const GameFlowStateRestartGame()),
    );
  }
}

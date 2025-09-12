import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_event.dart';
import 'package:math_game/math_game/domain/bloc/game_flow_bloc/game_flow_state.dart';

class GameFlowBloc extends Bloc<GameFlowEvent, GameFlowState> {
  GameFlowBloc() : super(const GameFlowState.showSettings()) {
    on<GameFlowEventShowSettings>(
      (event, emit) => emit(const GameFlowState.showSettings()),
    );
    on<GameFlowEventStartGame>(
      (event, emit) => emit(GameFlowState.startGame(event.generator)),
    );
    on<GameFlowEventFinishGame>(
      (event, emit) => emit(const GameFlowState.finishGame()),
    );
    on<GameFlowEventGameOver>(
      (event, emit) => emit(GameFlowState.gameOver(event.scores)),
    );
    on<GameFlowEventRestartGame>(
      (event, emit) => emit(const GameFlowState.restartGame()),
    );
  }
}

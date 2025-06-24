import 'package:flutter_bloc/flutter_bloc.dart';

import 'snack_bloc_state.dart';

class SnackBloc extends Cubit<SnackBlocState> {
  SnackBloc() : super(const SnackBlocState.empty());

  void showStringError(String s) {
    emit(SnackBlocState.showStringError(s));
  }

  void showAndParseError(dynamic s) {
    emit(SnackBlocState.parseAndShowError(s));
  }
}

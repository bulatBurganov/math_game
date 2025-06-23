import 'package:flutter_bloc/flutter_bloc.dart';

import 'snack_bloc_state.dart';

class SnackBloc extends Cubit<SnackBlocState> {
  SnackBloc() : super(SnackBlocStateEmpty());

  void showStringError(String s) {
    emit(SnackBlocStateShowStringError(s));
  }

  void showAndParseError(dynamic s) {
    emit(SnackBlocStateParseAndShowError(s));
  }
}

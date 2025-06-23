abstract class SnackBlocState {}

class SnackBlocStateEmpty extends SnackBlocState {}

class SnackBlocStateShowStringError extends SnackBlocState {
  final String message;

  SnackBlocStateShowStringError(this.message);
}

class SnackBlocStateParseAndShowError extends SnackBlocState {
  final dynamic exception;

  SnackBlocStateParseAndShowError(this.exception);
}

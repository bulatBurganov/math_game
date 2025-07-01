import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'snack_bloc_state.freezed.dart';

@freezed
sealed class SnackBlocState with _$SnackBlocState {
  const factory SnackBlocState.empty() = SnackBlocStateEmpty;
  const factory SnackBlocState.showStringError(String message) =
      SnackBlocStateShowStringError;
  const factory SnackBlocState.parseAndShowError(dynamic exception) =
      SnackBlocStateParseAndShowError;
}

// abstract class SnackBlocState {}

// class SnackBlocStateEmpty extends SnackBlocState {}

// class SnackBlocStateShowStringError extends SnackBlocState {
//   final String message;

//   SnackBlocStateShowStringError(this.message);
// }

// class SnackBlocStateParseAndShowError extends SnackBlocState {
//   final dynamic exception;

//   SnackBlocStateParseAndShowError(this.exception);
// }

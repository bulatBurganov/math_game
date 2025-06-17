import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem_model.freezed.dart';

@freezed
class ProblemModel with _$ProblemModel {
  factory ProblemModel(String expression, double result, List<double> answers) =
      _ProblemModel;
}

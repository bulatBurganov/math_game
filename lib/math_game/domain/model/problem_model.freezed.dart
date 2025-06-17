// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'problem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProblemModel {
  String get expression => throw _privateConstructorUsedError;
  double get result => throw _privateConstructorUsedError;
  List<double> get answers => throw _privateConstructorUsedError;

  /// Create a copy of ProblemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProblemModelCopyWith<ProblemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemModelCopyWith<$Res> {
  factory $ProblemModelCopyWith(
    ProblemModel value,
    $Res Function(ProblemModel) then,
  ) = _$ProblemModelCopyWithImpl<$Res, ProblemModel>;
  @useResult
  $Res call({String expression, double result, List<double> answers});
}

/// @nodoc
class _$ProblemModelCopyWithImpl<$Res, $Val extends ProblemModel>
    implements $ProblemModelCopyWith<$Res> {
  _$ProblemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProblemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expression = null,
    Object? result = null,
    Object? answers = null,
  }) {
    return _then(
      _value.copyWith(
            expression: null == expression
                ? _value.expression
                : expression // ignore: cast_nullable_to_non_nullable
                      as String,
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as double,
            answers: null == answers
                ? _value.answers
                : answers // ignore: cast_nullable_to_non_nullable
                      as List<double>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProblemModelImplCopyWith<$Res>
    implements $ProblemModelCopyWith<$Res> {
  factory _$$ProblemModelImplCopyWith(
    _$ProblemModelImpl value,
    $Res Function(_$ProblemModelImpl) then,
  ) = __$$ProblemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String expression, double result, List<double> answers});
}

/// @nodoc
class __$$ProblemModelImplCopyWithImpl<$Res>
    extends _$ProblemModelCopyWithImpl<$Res, _$ProblemModelImpl>
    implements _$$ProblemModelImplCopyWith<$Res> {
  __$$ProblemModelImplCopyWithImpl(
    _$ProblemModelImpl _value,
    $Res Function(_$ProblemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProblemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expression = null,
    Object? result = null,
    Object? answers = null,
  }) {
    return _then(
      _$ProblemModelImpl(
        null == expression
            ? _value.expression
            : expression // ignore: cast_nullable_to_non_nullable
                  as String,
        null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as double,
        null == answers
            ? _value._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as List<double>,
      ),
    );
  }
}

/// @nodoc

class _$ProblemModelImpl implements _ProblemModel {
  _$ProblemModelImpl(this.expression, this.result, final List<double> answers)
    : _answers = answers;

  @override
  final String expression;
  @override
  final double result;
  final List<double> _answers;
  @override
  List<double> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'ProblemModel(expression: $expression, result: $result, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProblemModelImpl &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    expression,
    result,
    const DeepCollectionEquality().hash(_answers),
  );

  /// Create a copy of ProblemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProblemModelImplCopyWith<_$ProblemModelImpl> get copyWith =>
      __$$ProblemModelImplCopyWithImpl<_$ProblemModelImpl>(this, _$identity);
}

abstract class _ProblemModel implements ProblemModel {
  factory _ProblemModel(
    final String expression,
    final double result,
    final List<double> answers,
  ) = _$ProblemModelImpl;

  @override
  String get expression;
  @override
  double get result;
  @override
  List<double> get answers;

  /// Create a copy of ProblemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProblemModelImplCopyWith<_$ProblemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

import 'dart:math' as math;

class ExpressionGenerator {
  final _random = math.Random();
  final int _minValue;
  final int _maxValue;

  ExpressionGenerator({int minValue = 1, int maxValue = 10})
    : _minValue = minValue,
      _maxValue = maxValue,
      assert(minValue <= maxValue),
      assert(minValue != 0 || maxValue != 0);

  (String expression, int value) generate({
    required int numTerms,
    List<String> operations = const ['+', '-', '*', '/'],
  }) {
    if (numTerms < 2) throw ArgumentError('numTerms must be at least 2');
    if (operations.isEmpty)
      throw ArgumentError('Operations list cannot be empty');

    int currentValue = _generateNumber();
    String expression = currentValue.toString();
    final bool onlyDivision =
        operations.length == 1 && operations.contains('/');

    for (int i = 1; i < numTerms; i++) {
      final int number = onlyDivision
          ? _generateDivisor(currentValue)
          : _generateNumber();

      final String operation = _selectOperation(
        currentValue,
        number,
        operations,
        onlyDivision,
      );

      currentValue = _applyOperation(currentValue, number, operation);

      expression = _buildExpression(expression, number, operation, i);
    }

    return (expression, currentValue);
  }

  int _generateNumber() {
    return _minValue + _random.nextInt(_maxValue - _minValue + 1);
  }

  int _generateDivisor(int value) {
    final divisors = _findDivisors(value);
    if (divisors.isEmpty) {
      if (_minValue <= 1 && _maxValue >= 1) return 1;
      throw StateError(
        'No valid divisors for $value in range [$_minValue, $_maxValue]',
      );
    }
    return divisors[_random.nextInt(divisors.length)];
  }

  List<int> _findDivisors(int value) {
    final divisors = <int>[];
    final absValue = value.abs();
    final min = math.max(_minValue, 1);
    final maxVal = math.min(absValue, _maxValue);

    for (int i = min; i <= maxVal; i++) {
      if (absValue % i == 0) {
        divisors.add(i);
      }
    }
    return divisors;
  }

  String _selectOperation(
    int currentValue,
    int number,
    List<String> operations,
    bool onlyDivision,
  ) {
    if (onlyDivision) return '/';

    final shuffled = List.of(operations)..shuffle();
    for (final op in shuffled) {
      if (op == '/') {
        if (number != 0 && currentValue % number == 0) {
          return op;
        }
      } else {
        return op;
      }
    }
    return shuffled.first;
  }

  int _applyOperation(int a, int b, String op) {
    switch (op) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        if (b == 0) throw StateError('Division by zero');
        if (a % b != 0) throw StateError('Non-integer division');
        return a ~/ b;
      default:
        throw ArgumentError('Invalid operation: $op');
    }
  }

  String _buildExpression(
    String currentExpr,
    int number,
    String operation,
    int step,
  ) {
    final needsParentheses = step > 1;
    final expr = needsParentheses ? '($currentExpr)' : currentExpr;
    return '$expr $operation $number';
  }
}

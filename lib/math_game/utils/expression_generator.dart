import 'dart:math' as math;

abstract class ExpressionGenerator {
  (String expression, int value) generate();
}

class ArithmeticExpressionGenerator implements ExpressionGenerator {
  final _random = math.Random();
  final int minValue;
  final int maxValue;
  final int expressionLength;
  final List<String> operations;
  final bool positiveNumbersOnly;

  ArithmeticExpressionGenerator({
    this.minValue = 1,
    this.maxValue = 10,
    required this.expressionLength,
    this.operations = const ['+', '-', '*', '/'],
    this.positiveNumbersOnly = false,
  }) : assert(minValue <= maxValue),
       assert(minValue != 0 || maxValue != 0),
       assert(
         !positiveNumbersOnly || minValue > 0,
         'minValue must be positive when positiveNumbersOnly is true',
       );

  @override
  (String expression, int value) generate() {
    if (expressionLength < 2) {
      throw ArgumentError('numTerms must be at least 2');
    }
    if (operations.isEmpty) {
      throw ArgumentError('Operations list cannot be empty');
    }

    int currentValue = _generateNumber();
    String expression = currentValue.toString();
    int lastPriority = 2; // Приоритет числа считается высоким (2)
    final bool onlyDivision =
        operations.length == 1 && operations.contains('/');

    for (int i = 1; i < expressionLength; i++) {
      final int number;
      final String operation;

      if (onlyDivision) {
        number = _generateDivisor(currentValue);
        operation = '/';
      } else if (positiveNumbersOnly) {
        final possibleOperations = _getPossibleOperations(currentValue);
        if (possibleOperations.isEmpty) {
          operation = '+';
          number = _generateNumber();
        } else {
          operation =
              possibleOperations[_random.nextInt(possibleOperations.length)];
          number = _generateNumberForOperation(currentValue, operation);
        }
      } else {
        number = _generateNumber();
        operation = _selectOperation(
          currentValue,
          number,
          operations,
          onlyDivision,
        );
      }

      final newOpPriority = _getPriority(operation);
      final needsParentheses = lastPriority < newOpPriority;

      currentValue = _applyOperation(currentValue, number, operation);
      expression = _buildExpression(
        expression,
        number,
        operation,
        needsParentheses,
      );
      lastPriority = newOpPriority;
    }

    return (expression, currentValue);
  }

  int _getPriority(String op) {
    switch (op) {
      case '+':
      case '-':
        return 1;
      case '*':
      case '/':
        return 2;
      default:
        throw ArgumentError('Invalid operation: $op');
    }
  }

  List<String> _getPossibleOperations(int currentValue) {
    final possibleOperations = <String>[];

    for (final op in operations) {
      if (op == '+') {
        possibleOperations.add(op);
      } else if (op == '-') {
        if (currentValue > minValue) {
          possibleOperations.add(op);
        }
      } else if (op == '*') {
        possibleOperations.add(op);
      } else if (op == '/') {
        if (_findDivisors(currentValue).isNotEmpty) {
          possibleOperations.add(op);
        }
      }
    }

    return possibleOperations;
  }

  int _generateNumberForOperation(int currentValue, String operation) {
    if (operation == '-') {
      final maxNum = math.min(maxValue, currentValue - 1);
      if (maxNum < minValue) {
        return minValue;
      }
      return minValue + _random.nextInt(maxNum - minValue + 1);
    } else if (operation == '/') {
      return _generateDivisor(currentValue);
    } else {
      return _generateNumber();
    }
  }

  int _generateNumber() {
    return minValue + _random.nextInt(maxValue - minValue + 1);
  }

  int _generateDivisor(int value) {
    final divisors = _findDivisors(value);
    if (divisors.isEmpty) {
      if (minValue <= 1 && maxValue >= 1) return 1;
      throw StateError(
        'No valid divisors for $value in range [$minValue, $maxValue]',
      );
    }
    return divisors[_random.nextInt(divisors.length)];
  }

  List<int> _findDivisors(int value) {
    final divisors = <int>[];
    final absValue = value.abs();
    final min = math.max(minValue, 1);
    final maxVal = math.min(absValue, maxValue);

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
    bool needsParentheses,
  ) {
    final expr = needsParentheses ? '($currentExpr)' : currentExpr;
    return '$expr $operation $number';
  }
}

import 'package:flutter/material.dart';

/// Provides a fluent interface for conditional widget building, mimicking an if-else if-else chain.
///
/// Start the chain with the top-level [If] function.
///
/// ## Example
///
/// ```dart
/// If(condition1,
///   then: Text('Condition 1 is true'),
/// )
/// .ElseIf(condition2,
///   then: Text('Condition 2 is true'),
/// )
/// .Else(
///   then: Text('Neither condition was true'),
/// )
/// ```
IfResult If(bool condition, {required Widget then}) {
  return IfResult._(condition, then);
}

/// A widget that builds one of its child widgets based on a series of conditions.
class IfResult extends StatelessWidget {
  final bool _initialCondition;
  final Widget _initialThen;
  final List<MapEntry<bool, Widget>> _elseIfs = [];
  Widget? _orElse;

  IfResult._(this._initialCondition, this._initialThen);

  /// Specifies the widget to build if the previous conditions were false and [condition] is true.
  ///
  /// Can be chained multiple times.
  IfResult elseIf(bool condition, {required Widget then}) {
    if (_orElse != null) {
      throw StateError(
          'Cannot add an ElseIf condition after an Else has been defined.');
    }
    _elseIfs.add(MapEntry(condition, then));
    return this;
  }

  /// Specifies the widget to build if all previous conditions were false.
  ///
  /// This terminates the chain.
  IfResult Else({required Widget then}) {
    if (_orElse != null) {
      throw StateError('Cannot define more than one Else condition.');
    }
    _orElse = then;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    if (_initialCondition) {
      return _initialThen;
    }

    for (final entry in _elseIfs) {
      if (entry.key) {
        return entry.value;
      }
    }

    return _orElse ?? const SizedBox.shrink();
  }
}

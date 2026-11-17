import 'package:flutter/material.dart';

class ValueNotifierWidget extends StatelessWidget {
  final ValueNotifier valueNotifier;
  final Widget child;

  const ValueNotifierWidget({super.key, required this.valueNotifier, required this.child});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (BuildContext context, value, Widget? child) {
          return child!;
        },
        child: child);
  }
}

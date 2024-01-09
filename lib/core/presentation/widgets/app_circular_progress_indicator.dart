import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({
    super.key,
    this.value,
  });

  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      child: Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CircularProgressIndicator.adaptive(
            value: value,
          ),
        ),
      ),
    );
  }
}

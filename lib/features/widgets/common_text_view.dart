import 'package:flutter/widgets.dart';

class CommonTextView extends StatelessWidget {
  const CommonTextView({
    super.key,
    required this.alignment,
    required this.child,
  });

  final Alignment alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: child,
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';

@RoutePage()
class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Coming Soon Screen',
          style: TextStyle(color: ColorConstants.white1),
        ),
      ),
    );
  }
}

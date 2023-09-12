import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';

@RoutePage()
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'More Screen',
          style: TextStyle(color: ColorConstants.white1),
        ),
      ),
    );
  }
}

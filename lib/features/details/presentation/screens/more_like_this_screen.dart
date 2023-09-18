import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';

@RoutePage()
class MoreLikeThisScreen extends StatelessWidget {
  const MoreLikeThisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'More like this screen',
        style: TextStyles.bodyText1,
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TvShowsScreen extends StatelessWidget {
  const TvShowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'TV Shows Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Movies Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

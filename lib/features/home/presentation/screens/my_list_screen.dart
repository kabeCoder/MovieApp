import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'MyList Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

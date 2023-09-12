import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/features/home/presentation/widgets/tv_shows/tv_shows_vertical_list_view.dart';

@RoutePage()
class TvShowsScreen extends StatelessWidget {
  const TvShowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TvShowsVerticalListView(
        collection: 'tvShow',
      ),
    );
  }
}

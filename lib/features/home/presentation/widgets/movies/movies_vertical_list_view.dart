import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';

import 'package:movie_app/core/domain/utils/enums/movies_filter.dart';
import 'package:movie_app/features/home/presentation/widgets/build_horizontal_list_view.dart';
import 'package:movie_app/features/home/presentation/widgets/movies/movies_horizontal_list_view.dart';

class MoviesVerticalListView extends StatelessWidget {
  const MoviesVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BuildHorizontalListView(
            moviesFilter: MoviesFilter.popular,
            child: MoviesHorizontalListView(
              title: context.l10n.label_popular,
            ),
          ),
          BuildHorizontalListView(
            moviesFilter: MoviesFilter.nowPlaying,
            child: MoviesHorizontalListView(
              title: context.l10n.label_now_playing,
            ),
          ),
          BuildHorizontalListView(
            moviesFilter: MoviesFilter.upcoming,
            child: MoviesHorizontalListView(
              title: context.l10n.label_Upcoming,
            ),
          ),
          BuildHorizontalListView(
            moviesFilter: MoviesFilter.topRated,
            child: MoviesHorizontalListView(
              title: context.l10n.label_top_rated,
            ),
          ),
        ],
      ),
    );
  }
}

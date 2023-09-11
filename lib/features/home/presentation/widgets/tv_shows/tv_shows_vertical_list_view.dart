import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';

import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/features/home/presentation/widgets/build_horizontal_list_view.dart';
import 'package:movie_app/features/home/presentation/widgets/tv_shows/tv_shows_horizontal_list_view.dart';

class TvShowsVerticalListView extends StatelessWidget {
  const TvShowsVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BuildHorizontalListView(
            tmdbFilter: TmdbFilter.airingToday,
            child: TvShowsHorizontalListView(
              title: context.l10n.label_airing_today,
            ),
          ),
          BuildHorizontalListView(
            tmdbFilter: TmdbFilter.popular,
            child: TvShowsHorizontalListView(
              title: context.l10n.label_popular,
            ),
          ),
          BuildHorizontalListView(
            tmdbFilter: TmdbFilter.onTheAir,
            child: TvShowsHorizontalListView(
              title: context.l10n.label_on_the_air,
            ),
          ),
          BuildHorizontalListView(
            tmdbFilter: TmdbFilter.topRated,
            child: TvShowsHorizontalListView(
              title: context.l10n.label_top_rated,
            ),
          ),
        ],
      ),
    );
  }
}

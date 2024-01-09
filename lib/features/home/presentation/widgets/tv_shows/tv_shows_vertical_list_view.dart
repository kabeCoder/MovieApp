import 'package:flutter/material.dart';

import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/features/home/presentation/widgets/tmdb_horizontal_list_view.dart';
import 'package:movie_app/features/home/presentation/widgets/home_bloc_provider.dart';

class TvShowsVerticalListView extends StatelessWidget {
  const TvShowsVerticalListView({
    super.key,
    required this.collection,
  });

  final String collection;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeBlocProvider(
            tmdbFilter: TmdbFilter.airingToday,
            child: TmdbHorizontalListView(
              title: context.l10n.label_airing_today,
              collection: collection,
            ),
          ),
          HomeBlocProvider(
            tmdbFilter: TmdbFilter.popular,
            child: TmdbHorizontalListView(
              title: context.l10n.label_popular,
              collection: collection,
            ),
          ),
          HomeBlocProvider(
            tmdbFilter: TmdbFilter.onTheAir,
            child: TmdbHorizontalListView(
              title: context.l10n.label_on_the_air,
              collection: collection,
            ),
          ),
          HomeBlocProvider(
            tmdbFilter: TmdbFilter.topRated,
            child: TmdbHorizontalListView(
              title: context.l10n.label_top_rated,
              collection: collection,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/features/home/presentation/widgets/common_horizontal_list_view.dart';
import 'package:movie_app/features/home/presentation/widgets/home_bloc_provider.dart';

class MoviesVerticalListView extends StatelessWidget {
  const MoviesVerticalListView({
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
            tmdbFilter: TmdbFilter.popular,
            child: CommonHorizontalListView(
              title: context.l10n.label_popular,
              collection: collection,
            ),
          ),
          HomeBlocProvider(
            tmdbFilter: TmdbFilter.nowPlaying,
            child: CommonHorizontalListView(
              title: context.l10n.label_now_playing,
              collection: collection,
            ),
          ),
          HomeBlocProvider(
            tmdbFilter: TmdbFilter.upcoming,
            child: CommonHorizontalListView(
              title: context.l10n.label_Upcoming,
              collection: collection,
            ),
          ),
          HomeBlocProvider(
            tmdbFilter: TmdbFilter.topRated,
            child: CommonHorizontalListView(
              title: context.l10n.label_top_rated,
              collection: collection,
            ),
          ),
        ],
      ),
    );
  }
}

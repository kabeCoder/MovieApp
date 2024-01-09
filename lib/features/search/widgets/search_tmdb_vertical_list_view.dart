import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/features/home/presentation/widgets/tmdb_horizontal_list_view.dart';
import 'package:movie_app/features/search/widgets/search_bloc_provider.dart';
import 'package:movie_app/features/search/widgets/search_tmdb_horizontal_list_item.dart';

class SearchTmdbVerticalListView extends StatelessWidget {
  const SearchTmdbVerticalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchBlocProvider(
            timeWindow: "week",
            child: TmdbHorizontalListView(
              title: context.l10n.label_trending_people,
              collection: context.l10n.collection_people,
            ),
          ),
          SearchBlocProvider(
            child: SearchTmdbHorizontalListView(
              title: context.l10n.label_discover_tv_and_movies,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
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
            child: SearchTmdbHorizontalListView(
              title: "Discover Tv Shows",
              collection: context.l10n.collection_tv_show,
            ),
          ),
          SearchBlocProvider(
            child: SearchTmdbHorizontalListView(
              title: "Discover Movies",
              collection: context.l10n.collection_movie,
            ),
          ),
        ],
      ),
    );
  }
}

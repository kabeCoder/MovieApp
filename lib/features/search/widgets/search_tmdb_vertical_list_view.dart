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
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBlocProvider(
              child: SearchTmdbHorizontalListView(
                title: context.l10n.label_discover_tv_and_movies,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

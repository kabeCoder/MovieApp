import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/features/home/presentation/widgets/movies/movies_vertical_list_view.dart';

@RoutePage()
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MoviesVerticalListView(
        collection: context.l10n.collection_movie,
      ),
    );
  }
}

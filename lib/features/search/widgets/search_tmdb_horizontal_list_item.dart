import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/home/presentation/widgets/tmdb_vertical_item.dart';

class SearchTmdbHorizontalListView extends StatelessWidget {
  const SearchTmdbHorizontalListView({
    super.key,
    required this.title,
    required this.collection,
  });

  final String title;
  final String collection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              title,
              style: TextStyles.bodyText1,
            ),
          ),
          const SizedBox(height: 8),
          if (collection == context.l10n.collection_movie)
            BlocConsumer<MovieBloc, MovieState>(
              listener: (context, state) => state.whenOrNull(
                encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                  ),
                ),
              ),
              builder: (_, state) => state.maybeWhen(
                loadingMovies: () => const Center(
                  child: AppCircularProgressIndicator(),
                ),
                loadedMovies: (movies) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final movie in movies)
                        VerticalItem(
                          collection: context.l10n.collection_movie,
                          movie: movie,
                        ),
                    ],
                  ),
                ),
                orElse: SizedBox.shrink,
              ),
            ),
          if (collection == context.l10n.collection_tv_show)
            BlocConsumer<TvShowBloc, TvShowState>(
              listener: (context, state) => state.whenOrNull(
                encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                  ),
                ),
              ),
              builder: (_, state) => state.maybeWhen(
                loadingTvShows: () => const Center(
                  child: AppCircularProgressIndicator(),
                ),
                loadedTvShows: (tvShows) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final tvShow in tvShows)
                        VerticalItem(
                          collection: context.l10n.collection_tv_show,
                          tvShow: tvShow,
                        ),
                    ],
                  ),
                ),
                orElse: SizedBox.shrink,
              ),
            ),
        ],
      ),
    );
  }
}

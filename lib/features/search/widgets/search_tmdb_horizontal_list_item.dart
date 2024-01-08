import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/details/presentation/widgets/tmdb_horizontal_item.dart';

class SearchTmdbHorizontalListView extends StatelessWidget {
  const SearchTmdbHorizontalListView({
    super.key,
    required this.title,
  });

  final String title;

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
              loadedMovies: (movies) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    for (final movie in movies)
                      TmdbHorizontalItem(
                        collection: context.l10n.collection_movie,
                        movie: movie,
                      ),
                  ],
                ),
              ),
              orElse: SizedBox.shrink,
            ),
          ),
          const SizedBox(height: 8),
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
              loadedTvShows: (tvShows) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    for (final tvShow in tvShows)
                      TmdbHorizontalItem(
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

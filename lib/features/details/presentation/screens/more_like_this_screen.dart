import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/core/domain/bloc/similar_movie_bloc/similar_movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/similar_tv_show_bloc/similar_tv_show_bloc.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/details/presentation/widgets/details_bloc_provider.dart';
import 'package:movie_app/features/details/presentation/widgets/tmdb_horizontal_item.dart';

@RoutePage()
class MoreLikeThisScreen extends StatelessWidget {
  const MoreLikeThisScreen({
    super.key,
    required this.collection,
    required this.tmdbFilter,
    required this.tmdbId,
  });
  final String collection;
  final TmdbFilter tmdbFilter;
  final int tmdbId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (collection == context.l10n.collection_tv_show)
            DetailsBlocProvider(
              tmdbFilter: tmdbFilter,
              tvShowId: tmdbId,
              child: BlocConsumer<SimilarTvShowBloc, SimilarTvShowState>(
                listener: (context, state) => state.whenOrNull(
                  encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                    ),
                  ),
                ),
                builder: (_, state) => state.maybeWhen(
                  loadingSimilarTvShows: () => const Center(
                    child: AppCircularProgressIndicator(),
                  ),
                  loadedSimilarTvShows: (similarTvShows) => Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (final similarTvShow in similarTvShows)
                          TmdbHorizontalItem(
                            collection: context.l10n.collection_tv_show,
                            tvShow: similarTvShow,
                          ),
                      ],
                    ),
                  ),
                  orElse: SizedBox.shrink,
                ),
              ),
            ),
          if (collection == context.l10n.collection_movie)
            DetailsBlocProvider(
              tmdbFilter: tmdbFilter,
              movieId: tmdbId,
              child: BlocConsumer<SimilarMovieBloc, SimilarMovieState>(
                listener: (context, state) => state.whenOrNull(
                  encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                    ),
                  ),
                ),
                builder: (_, state) => state.maybeWhen(
                  loadingSimilarMovies: () => const Center(
                    child: AppCircularProgressIndicator(),
                  ),
                  loadedSimilarMovies: (similarMovies) => Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (final similarMovie in similarMovies)
                          TmdbHorizontalItem(
                            collection: context.l10n.collection_movie,
                            movie: similarMovie,
                          ),
                      ],
                    ),
                  ),
                  orElse: SizedBox.shrink,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/new_and_hot/presentation/widgets/new_and_hot_horizontal_listview.dart';

class TmdbVerticalListView extends StatelessWidget {
  const TmdbVerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
            loadedMovies: (movies) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (final movie in movies)
                  NewAndHotHorizonalListView(
                    collection: context.l10n.collection_movie,
                    movie: movie,
                  ),
              ],
            ),
            orElse: SizedBox.shrink,
          ),
        ),
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
            loadedTvShows: (tvShows) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (final tvShow in tvShows)
                  NewAndHotHorizonalListView(
                    collection: context.l10n.collection_tv_show,
                    tvShow: tvShow,
                  ),
              ],
            ),
            orElse: SizedBox.shrink,
          ),
        ),
      ],
    );
  }
}

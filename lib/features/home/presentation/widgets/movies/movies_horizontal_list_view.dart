import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/home/presentation/widgets/movies/movie_vertical_item.dart';

class MoviesHorizontalListView extends StatelessWidget {
  const MoviesHorizontalListView({
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
              loadedMovies: (movies) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final movie in movies)
                      MovieVerticalItem(
                        movie: movie,
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

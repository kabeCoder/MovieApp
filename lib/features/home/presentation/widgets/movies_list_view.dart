import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/home/presentation/widgets/movie_item.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
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
        loadedMovies: (movies) => ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => MovieItem(
            movie: movies[index],
          ),
        ),
        orElse: SizedBox.shrink,
      ),
    );
  }
}

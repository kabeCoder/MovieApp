import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

part 'similar_movie_event.dart';
part 'similar_movie_state.dart';
part 'similar_movie_bloc.freezed.dart';

class SimilarMovieBloc extends Bloc<SimilarMovieEvent, SimilarMovieState> {
  SimilarMovieBloc({
    required this.similarMoviesRepositoryImplementation,
  }) : super(
          const _Initial(),
        ) {
    on<_GetMoviesSimilar>(
      (event, emit) async {
        final response = await similarMoviesRepositoryImplementation.getSimilarMovies(event.tmdbSimilarFilter, event.movieId);

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<MovieModel> similarMovies = response.data?.toList() ?? [];
          emit(
            _LoadedSimilarMovies(similarMovies: similarMovies),
          );
        }
      },
    );
  }

  final TmdbRepositoryImplementation similarMoviesRepositoryImplementation;
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

part 'movie_event.dart';
part 'movie_state.dart';
part 'movie_bloc.freezed.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({
    required this.movieRepositoryImplementation,
  }) : super(const _Initial()) {
    on<_GetMovies>(
      (event, emit) async {
        final response = await movieRepositoryImplementation.getMovies(
          event.moviesFilter,
          event.timeWindow,
        );

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<MovieModel> movies = response.data?.toList() ?? [];
          emit(_LoadedMovies(movies: movies));
        }
      },
    );
  }

  final TmdbRepositoryImplementation movieRepositoryImplementation;
}

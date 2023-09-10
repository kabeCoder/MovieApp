import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/movie.dart';
import 'package:movie_app/core/domain/repositories/movie_repository_impl.dart';
import 'package:movie_app/core/domain/utils/enums/movies_filter.dart';

part 'movie_event.dart';
part 'movie_state.dart';
part 'movie_bloc.freezed.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({
    required this.movieRepositoryImplementation,
  }) : super(const _Initial()) {
    on<_GetMovies>((event, emit) async {
      emit(const _LoadingMovies());

      final response = await movieRepositoryImplementation.getMovies(event.moviesFilter);
      final List<MovieModel> movies = response.data?.toList() ?? [];

      if (response.error != null) {
        emit(_EncounteredError(errorMessage: response.error.toString()));
      } else {
        emit(_$_LoadedMovies(movies: movies));
      }
    });
  }

  final MovieRepositoryImplementation movieRepositoryImplementation;
}

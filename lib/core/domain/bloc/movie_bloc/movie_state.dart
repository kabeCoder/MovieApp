part of 'movie_bloc.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState.initial() = _Initial;

  const factory MovieState.loadingMovies() = _LoadingMovies;

  const factory MovieState.loadedMovies({
    required List<MovieModel> movies,
  }) = _LoadedMovies;

  const factory MovieState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

part of 'similar_movie_bloc.dart';

@freezed
class SimilarMovieState with _$SimilarMovieState {
  const factory SimilarMovieState.initial() = _Initial;

  const factory SimilarMovieState.loadingSimilarMovies() = _LoadingSimilarMovies;

  const factory SimilarMovieState.loadedSimilarMovies({
    required List<MovieModel> similarMovies,
  }) = _LoadedSimilarMovies;

  const factory SimilarMovieState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

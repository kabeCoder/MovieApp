part of 'similar_movie_bloc.dart';

@freezed
class SimilarMovieEvent with _$SimilarMovieEvent {
  const factory SimilarMovieEvent.started() = _Started;

  const factory SimilarMovieEvent.getSimilarMovies(
    TmdbFilter tmdbSimilarFilter,
    int movieId,
  ) = _GetMoviesSimilar;
}

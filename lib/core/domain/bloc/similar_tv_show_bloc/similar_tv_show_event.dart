part of 'similar_tv_show_bloc.dart';

@freezed
class SimilarTvShowEvent with _$SimilarTvShowEvent {
  const factory SimilarTvShowEvent.started() = _Started;

  const factory SimilarTvShowEvent.getSimilarTvShows(
    TmdbFilter tmdbSimilarFilter,
    int tvShowId,
  ) = _GetSimilarTvShows;
}

part of 'similar_tv_show_bloc.dart';

@freezed
class SimilarTvShowState with _$SimilarTvShowState {
  const factory SimilarTvShowState.initial() = _Initial;

  const factory SimilarTvShowState.loadingSimilarTvShows() = _LoadingSimilarTvShows;

  const factory SimilarTvShowState.loadedSimilarTvShows({
    required List<TvShowModel> similarTvShows,
  }) = _LoadedSimilarTvShows;

  const factory SimilarTvShowState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

part of 'similar_tv_show_bloc.dart';

@freezed
class SimilarTvShowState with _$SimilarTvShowState {
  const factory SimilarTvShowState.initial() = _Initial;

  const factory SimilarTvShowState.loadingSimilar() = _LoadingTvShowSimilar;

  const factory SimilarTvShowState.loadedSimilar({
    required List<TvShowModel> tvShowSimilar,
  }) = _LoadedTvShowSimilar;

  const factory SimilarTvShowState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

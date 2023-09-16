part of 'tv_show_casts_bloc.dart';

@freezed
class TvShowCastsState with _$TvShowCastsState {
  const factory TvShowCastsState.initial() = _Initial;

  const factory TvShowCastsState.loadingTvShowCasts() = _LoadingTvShowCasts;

  const factory TvShowCastsState.loadedTvShowCasts({
    required List<TvShowCastsModel> tvShowCasts,
  }) = _LoadedTvShowCasts;

  const factory TvShowCastsState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

part of 'tv_show_bloc.dart';

@freezed
class TvShowState with _$TvShowState {
  const factory TvShowState.initial() = _Initial;

  const factory TvShowState.loadingTvShows() = _LoadingTvShows;

  const factory TvShowState.loadedTvShows({
    required List<TvShowModel> tvShow,
  }) = _LoadedTvShows;

  const factory TvShowState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

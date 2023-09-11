part of 'tv_show_bloc.dart';

@freezed
class TvShowState with _$TvShowState {
  const factory TvShowState.initial() = _Initial;

  const factory TvShowState.loadingMovies() = _LoadingTvShow;

  const factory TvShowState.loadedMovies({
    required List<TvShowModel> movies,
  }) = _LoadedTvShow;

  const factory TvShowState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

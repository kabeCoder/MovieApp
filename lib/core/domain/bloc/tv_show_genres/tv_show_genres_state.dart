part of 'tv_show_genres_bloc.dart';

@freezed
class TvShowGenresState with _$TvShowGenresState {
  const factory TvShowGenresState.initial() = _Initial;

  const factory TvShowGenresState.loadingTvShowGenres() = _LoadingTvShowGenres;

  const factory TvShowGenresState.loadedTvShowGenres({
    required List<TvShowGenresModel> tvShowGenres,
  }) = _LoadedTvShowGenres;

  const factory TvShowGenresState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

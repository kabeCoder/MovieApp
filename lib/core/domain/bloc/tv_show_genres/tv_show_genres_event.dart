part of 'tv_show_genres_bloc.dart';

@freezed
class TvShowGenresEvent with _$TvShowGenresEvent {
  const factory TvShowGenresEvent.started() = _Started;

  const factory TvShowGenresEvent.getTvShowGenres(
    TmdbFilter tvShowGenresFilter,
  ) = _GetTvShowGenres;
}

part of 'tv_show_bloc.dart';

@freezed
class TvShowEvent with _$TvShowEvent {
  const factory TvShowEvent.started() = _Started;

  const factory TvShowEvent.getTvShows(
    TmdbFilter tvShowsFilter,
    String? timeWindow,
  ) = _GetTvShows;
}

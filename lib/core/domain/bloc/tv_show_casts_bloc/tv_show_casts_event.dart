part of 'tv_show_casts_bloc.dart';

@freezed
class TvShowCastsEvent with _$TvShowCastsEvent {
  const factory TvShowCastsEvent.started() = _Started;

  const factory TvShowCastsEvent.getTvShowCasts(
    int seriesId,
  ) = _GetTvShowCasts;
}

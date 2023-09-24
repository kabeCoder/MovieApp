part of 'video_bloc.dart';

@freezed
class VideoEvent with _$VideoEvent {
  const factory VideoEvent.started() = _Started;

  const factory VideoEvent.getVideos(
    TmdbFilter tmdbVideoFilter,
    int tmdbVideoId,
  ) = _GetVideos;
}

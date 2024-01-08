part of 'video_bloc.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState.initial() = _Initial;

  const factory VideoState.loadingVideos() = _LoadingVideos;

  const factory VideoState.loadedVideos({
    required List<VideoModel> video,
  }) = _LoadedVideos;

  const factory VideoState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

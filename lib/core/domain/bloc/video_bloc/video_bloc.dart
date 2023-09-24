import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/video/video.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

part 'video_event.dart';
part 'video_state.dart';
part 'video_bloc.freezed.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc({
    required this.videoRepositoryImplementation,
  }) : super(
          const _Initial(),
        ) {
    on<_GetVideos>(
      (event, emit) async {
        final response = await videoRepositoryImplementation.getVideo(event.tmdbVideoFilter, event.tmdbVideoId);

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<VideoModel> video = response.data?.toList() ?? [];
          emit(
            _$_LoadedVideos(video: video),
          );
        }
      },
    );
  }

  final TmdbRepositoryImplementation videoRepositoryImplementation;
}

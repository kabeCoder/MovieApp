import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/video/video.dart';

part 'video_response_dto.freezed.dart';
part 'video_response_dto.g.dart';

@freezed
class VideoResponseDto with _$VideoResponseDto {
  const factory VideoResponseDto({
    required String name,
    required String key,
    required String site,
    required String type,
    @JsonKey(name: 'published_at') required String publishedAt,
    required String id,
  }) = _VideoResponseDto;

  factory VideoResponseDto.fromJson(Map<String, dynamic> json) => _$VideoResponseDtoFromJson(json);

  const VideoResponseDto._();

  VideoModel toDomain() => VideoModel(
        name: name,
        key: key,
        site: site,
        type: type,
        publishedAt: publishedAt,
        id: id,
      );
}

extension ToDomain on List<VideoResponseDto> {
  List<VideoModel> toDomain() => map((getVideoResponse) => getVideoResponse.toDomain()).toList();
}

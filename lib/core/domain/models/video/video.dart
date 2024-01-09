import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String name,
    required String key,
    required String site,
    required String type,
    required String publishedAt,
    required String id,
  }) = _VideoModel;
}

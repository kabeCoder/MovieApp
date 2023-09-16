import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/domain/models/tv_show_casts/tv_show_casts.dart';

part 'tv_show_casts_response_dto.freezed.dart';
part 'tv_show_casts_response_dto.g.dart';

@freezed
class TvShowCastsResponseDto with _$TvShowCastsResponseDto {
  const factory TvShowCastsResponseDto({
    required int id,
    required String name,
    @JsonKey(name: 'profile_path') String? profilePath,
    required int order,
  }) = _TvShowCastsResponseDto;

  factory TvShowCastsResponseDto.fromJson(Map<String, dynamic> json) => _$TvShowCastsResponseDtoFromJson(json);

  const TvShowCastsResponseDto._();

  TvShowCastsModel toDomain() => TvShowCastsModel(
        id: id,
        name: name,
        profileUrl: Uri.parse('${Env.baseImageUrl}/w500/$profilePath'),
        order: order,
      );
}

extension ToDomain on List<TvShowCastsResponseDto> {
  List<TvShowCastsModel> toDomain() => map((getTvShowCastsResponse) => getTvShowCastsResponse.toDomain()).toList();
}

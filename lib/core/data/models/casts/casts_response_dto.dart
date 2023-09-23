import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/domain/models/casts/casts.dart';

part 'casts_response_dto.freezed.dart';
part 'casts_response_dto.g.dart';

@freezed
class CastsResponseDto with _$CastsResponseDto {
  const factory CastsResponseDto({
    required int id,
    required String name,
    @JsonKey(name: 'profile_path') String? profilePath,
    required int order,
  }) = _CastsResponseDto;

  factory CastsResponseDto.fromJson(Map<String, dynamic> json) => _$CastsResponseDtoFromJson(json);

  const CastsResponseDto._();

  CastsModel toDomain() => CastsModel(
        id: id,
        name: name,
        profileUrl: Uri.parse('${Env.baseImageUrl}/w500/$profilePath'),
        order: order,
      );
}

extension ToDomain on List<CastsResponseDto> {
  List<CastsModel> toDomain() => map((getTvShowCastsResponse) => getTvShowCastsResponse.toDomain()).toList();
}

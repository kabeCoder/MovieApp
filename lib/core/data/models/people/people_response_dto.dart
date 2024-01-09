import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/domain/models/people/people.dart';

part 'people_response_dto.freezed.dart';
part 'people_response_dto.g.dart';

@freezed
class PeopleResponseDto with _$PeopleResponseDto {
  const factory PeopleResponseDto({
    required int id,
    required String? name,
    @JsonKey(name: 'original_name') required String? originalName,
    @JsonKey(name: 'profile_path') required String? profilePath,
  }) = _PeopleResponseDto;

  factory PeopleResponseDto.fromJson(Map<String, dynamic> json) => _$PeopleResponseDtoFromJson(json);

  const PeopleResponseDto._();

  PeopleModel toDomain() => PeopleModel(
        id: id,
        name: name ?? '',
        originalName: originalName ?? '',
        profilePath: Uri.parse('${Env.baseImageUrl}/w500/$profilePath'),
      );
}

extension ToDomain on List<PeopleResponseDto> {
  List<PeopleModel> toDomain() => map((getPeopleResponse) => getPeopleResponse.toDomain()).toList();
}

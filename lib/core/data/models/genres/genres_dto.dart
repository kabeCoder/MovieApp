import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/genres/genres.dart';

part 'genres_dto.freezed.dart';
part 'genres_dto.g.dart';

@freezed
class GenresResponseDto with _$GenresResponseDto {
  const factory GenresResponseDto({
    required int id,
    required String name,
  }) = _GenresResponseDto;

  factory GenresResponseDto.fromJson(Map<String, dynamic> json) => _$GenresResponseDtoFromJson(json);

  const GenresResponseDto._();

  GenresModel toDomain() => GenresModel(
        id: id,
        name: name,
      );
}

extension ToDomain on List<GenresResponseDto> {
  List<GenresModel> toDomain() => map((getGenresResponse) => getGenresResponse.toDomain()).toList();
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/tv_show_genres/tv_show_genres.dart';

part 'tv_show_genres_dto.freezed.dart';
part 'tv_show_genres_dto.g.dart';

@freezed
class TvShowGenresResponseDto with _$TvShowGenresResponseDto {
  const factory TvShowGenresResponseDto({
    required int id,
    required String name,
  }) = _TvShowGenresResponseDto;

  factory TvShowGenresResponseDto.fromJson(Map<String, dynamic> json) => _$TvShowGenresResponseDtoFromJson(json);

  const TvShowGenresResponseDto._();

  TvShowGenresModel toDomain() => TvShowGenresModel(
        id: id,
        name: name,
      );
}

extension ToDomain on List<TvShowGenresResponseDto> {
  List<TvShowGenresModel> toDomain() => map((getTvShowGenresResponse) => getTvShowGenresResponse.toDomain()).toList();
}

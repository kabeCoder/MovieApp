import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/domain/models/search/search.dart';

part 'search_response_dto.freezed.dart';
part 'search_response_dto.g.dart';

@freezed
class SearchResponseDto with _$SearchResponseDto {
  const factory SearchResponseDto({
    required int id,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    required String? name,
    required String? title,
  }) = _SearchResponseDto;

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) => _$SearchResponseDtoFromJson(json);

  const SearchResponseDto._();

  SearchModel toDomain() => SearchModel(
        id: id,
        backdropUrl: Uri.parse('${Env.baseImageBackdropUrl}/$backdropPath'),
        name: name ?? '',
        title: title ?? '',
      );
}

extension ToDomain on List<SearchResponseDto> {
  List<SearchModel> toDomain() => map((getSearchResponse) => getSearchResponse.toDomain()).toList();
}

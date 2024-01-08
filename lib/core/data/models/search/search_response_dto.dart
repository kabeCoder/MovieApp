import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/domain/models/search/search.dart';

part 'search_response_dto.freezed.dart';
part 'search_response_dto.g.dart';

@freezed
class SearchResponseDto with _$SearchResponseDto {
  const factory SearchResponseDto({
    required int id,
    required String? name,
    @JsonKey(name: 'origin_country') required List<String>? originCountry,
    @JsonKey(name: 'genre_ids') required List<int>? genreIds,
    @JsonKey(name: 'first_air_date') required String? firstAirDate,
    required String overview,
    required double popularity,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    required String? title,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'release_date') required String? releaseDate,
    @JsonKey(name: 'vote_average') required double voteAverage,
  }) = _SearchResponseDto;

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) => _$SearchResponseDtoFromJson(json);

  const SearchResponseDto._();

  SearchModel toDomain() => SearchModel(
        id: id,
        name: name ?? '',
        countries: originCountry ?? [],
        genreIds: genreIds ?? [],
        firstAirDate: firstAirDate ?? '',
        overview: overview,
        popularity: popularity,
        backdropUrl: backdropPath != null
            ? Uri.parse('${Env.baseImageBackdropUrl}/$backdropPath')
            : Uri.parse(
                'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg'),
        title: title ?? '',
        mediaType: mediaType ?? '',
        releaseDate: releaseDate?.isNotEmpty == true ? DateTime.parse(releaseDate!) : DateTime.now(),
        voteAverage: voteAverage,
      );
}

extension ToDomain on List<SearchResponseDto> {
  List<SearchModel> toDomain() => map((getSearchResponse) => getSearchResponse.toDomain()).toList();
}

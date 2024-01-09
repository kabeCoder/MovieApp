import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';

part 'tv_show_response_dto.freezed.dart';
part 'tv_show_response_dto.g.dart';

@freezed
class TvShowResponseDto with _$TvShowResponseDto {
  const factory TvShowResponseDto({
    required int id,
    required String? name,
    @JsonKey(name: 'origin_country') required List<String>? originCountry,
    @JsonKey(name: 'genre_ids') required List<int>? genreIds,
    @JsonKey(name: 'first_air_date') required String? firstAirDate,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
  }) = _TvShowResponseDto;

  factory TvShowResponseDto.fromJson(Map<String, dynamic> json) => _$TvShowResponseDtoFromJson(json);

  const TvShowResponseDto._();

  TvShowModel toDomain() => TvShowModel(
        id: id,
        name: name ?? '',
        countries: originCountry ?? [],
        genreIds: genreIds ?? [],
        firstAirDate: firstAirDate ?? '',
        overview: overview,
        popularity: popularity,
        posterUrl: Uri.parse('${Env.baseImageUrl}/w500$posterPath'),
        backdropUrl: backdropPath != null
            ? Uri.parse('${Env.baseImageBackdropUrl}/$backdropPath')
            : Uri.parse(
                'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg'),
        voteAverage: voteAverage,
      );
}

extension ToDomain on List<TvShowResponseDto> {
  List<TvShowModel> toDomain() => map((getTvShowResponse) => getTvShowResponse.toDomain()).toList();
}

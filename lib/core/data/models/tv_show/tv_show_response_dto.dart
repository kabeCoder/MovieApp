import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';

part 'tv_show_response_dto.freezed.dart';
part 'tv_show_response_dto.g.dart';

@freezed
class TvShowResponseDto with _$TvShowResponseDto {
  const factory TvShowResponseDto({
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    required String name,
    @JsonKey(name: 'origin_country') required List<String> originCountry,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _TvShowResponseDto;

  factory TvShowResponseDto.fromJson(Map<String, dynamic> json) => _$TvShowResponseDtoFromJson(json);

  const TvShowResponseDto._();

  TvShowModel toDomain() => TvShowModel(
        name: name,
        posterUrl: Uri.parse('${Env.baseImageUrl}/w500$posterPath'),
        backdropUrl: Uri.parse('${Env.baseImageBackdropUrl}$backdropPath'),
        description: overview,
        country: originCountry,
      );
}

extension ToDomain on List<TvShowResponseDto> {
  List<TvShowModel> toDomain() => map((getTvShowResponse) => getTvShowResponse.toDomain()).toList();
}

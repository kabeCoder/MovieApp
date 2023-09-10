import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/application/data/utils/env.dart';
import 'package:movie_app/core/domain/models/movie.dart';

part 'movie_response_dto.freezed.dart';
part 'movie_response_dto.g.dart';

@freezed
class MovieResponseDto with _$MovieResponseDto {
  const factory MovieResponseDto({
    required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    required int id,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    required String title,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _MovieResponseDto;

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) => _$MovieResponseDtoFromJson(json);

  const MovieResponseDto._();

  MovieModel toDomain() => MovieModel(
        id: id,
        title: title,
        posterUrl: Uri.parse('${Env.baseImageUrl}/w500$posterPath'),
        backdropUrl: Uri.parse('${Env.baseImageBackdropUrl}$backdropPath'),
        description: overview,
        releaseDate: DateTime.parse(releaseDate),
      );
}

extension ToDomain on List<MovieResponseDto> {
  List<MovieModel> toDomain() => map((getMovieResponse) => getMovieResponse.toDomain()).toList();
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    required int id,
    required List<int> genreIds,
    required String overview,
    required double popularity,
    required Uri posterUrl,
    required Uri backdropUrl,
    required String title,
    required DateTime releaseDate,
    required double voteAverage,
  }) = _MovieModel;
}

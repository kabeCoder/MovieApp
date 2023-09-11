import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel(
      {required int id,
      required String title,
      required Uri posterUrl,
      required Uri backdropUrl,
      required String description,
      required DateTime releaseDate}) = _MovieModel;
}

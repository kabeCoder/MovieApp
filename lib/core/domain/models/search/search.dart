import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    required int id,
    required String name,
    required List<String> countries,
    required List<int> genreIds,
    required String firstAirDate,
    required String overview,
    required double popularity,
    required Uri backdropUrl,
    required String title,
    required String mediaType,
    required DateTime releaseDate,
    required double voteAverage,
  }) = _SearchModel;
}

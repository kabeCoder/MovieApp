import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show.freezed.dart';

@freezed
class TvShowModel with _$TvShowModel {
  const factory TvShowModel({
    required int id,
    required String name,
    required List<String> countries,
    required List<int> genreIds,
    required String firstAirDate,
    required String overview,
    required double popularity,
    required Uri posterUrl,
    required Uri backdropUrl,
    required double voteAverage,
  }) = _TvShowModel;
}

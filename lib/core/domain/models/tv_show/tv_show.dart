import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show.freezed.dart';

@freezed
class TvShowModel with _$TvShowModel {
  const factory TvShowModel({
    required String name,
    required Uri posterUrl,
    required Uri backdropUrl,
    required String description,
    required List<String> country,
  }) = _TvShowModel;
}

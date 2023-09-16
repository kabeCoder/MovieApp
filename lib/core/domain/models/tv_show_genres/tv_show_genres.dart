import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_genres.freezed.dart';

@freezed
class TvShowGenresModel with _$TvShowGenresModel {
  const factory TvShowGenresModel({
    required int id,
    required String name,
  }) = _TvShowCastsModel;
}

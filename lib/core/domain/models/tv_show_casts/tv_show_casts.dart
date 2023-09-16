import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_show_casts.freezed.dart';

@freezed
class TvShowCastsModel with _$TvShowCastsModel {
  const factory TvShowCastsModel({
    required int id,
    required String name,
    required Uri profileUrl,
    required int order,
  }) = _TvShowCastsModel;
}

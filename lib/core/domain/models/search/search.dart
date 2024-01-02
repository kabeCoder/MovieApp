import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    required int id,
    required String name,
    required String title,
    required Uri backdropUrl,
  }) = _SearchModel;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'people.freezed.dart';

@freezed
class PeopleModel with _$PeopleModel {
  const factory PeopleModel({
    required int id,
    required String name,
    required String originalName,
    required Uri profilePath,
  }) = _PeopleModel;
}

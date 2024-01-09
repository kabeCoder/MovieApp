import 'package:freezed_annotation/freezed_annotation.dart';

part 'genres.freezed.dart';

@freezed
class GenresModel with _$GenresModel {
  const factory GenresModel({
    required int id,
    required String name,
  }) = _GenresModel;
}

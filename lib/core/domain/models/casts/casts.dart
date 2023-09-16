import 'package:freezed_annotation/freezed_annotation.dart';

part 'casts.freezed.dart';

@freezed
class CastsModel with _$CastsModel {
  const factory CastsModel({
    required int id,
    required String name,
    required Uri profileUrl,
    required int order,
  }) = _CastsModel;
}

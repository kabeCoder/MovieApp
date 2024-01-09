part of 'casts_bloc.dart';

@freezed
class CastsState with _$CastsState {
  const factory CastsState.initial() = _Initial;

  const factory CastsState.loadingCasts() = _LoadingCasts;

  const factory CastsState.loadedCasts({
    required List<CastsModel> casts,
  }) = _LoadedCasts;

  const factory CastsState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

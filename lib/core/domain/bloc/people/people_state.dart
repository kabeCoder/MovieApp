part of 'people_bloc.dart';

@freezed
class PeopleState with _$PeopleState {
  const factory PeopleState.initial() = _Initial;

  const factory PeopleState.loadingPeople() = _LoadingPeople;

  const factory PeopleState.loadedPeople({
    required List<PeopleModel> people,
  }) = _LoadedPeople;

  const factory PeopleState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

part of 'people_bloc.dart';

@freezed
class PeopleEvent with _$PeopleEvent {
  const factory PeopleEvent.started() = _Started;

  const factory PeopleEvent.getPeople(
    TmdbFilter tmdbPeopleFilter,
    String timeWindow,
  ) = _GetPeople;
}

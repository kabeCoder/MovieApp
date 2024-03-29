part of 'genres_bloc.dart';

@freezed
class GenresEvent with _$GenresEvent {
  const factory GenresEvent.started() = _Started;

  const factory GenresEvent.getGenres(
    TmdbFilter tmdbGenresFilter,
  ) = _GetGenres;
}

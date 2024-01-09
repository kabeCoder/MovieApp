part of 'genres_bloc.dart';

@freezed
class GenresState with _$GenresState {
  const factory GenresState.initial() = _Initial;

  const factory GenresState.loadingGenres() = _LoadingGenres;

  const factory GenresState.loadedGenres({
    required List<GenresModel> genres,
  }) = _LoadedGenres;

  const factory GenresState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

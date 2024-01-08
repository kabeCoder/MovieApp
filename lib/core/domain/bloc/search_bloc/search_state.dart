part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loadingSearch() = _LoadingSearch;

  const factory SearchState.loadedSearch({
    required List<SearchModel> searchTvShowOrMovie,
  }) = _LoadedSearch;

  const factory SearchState.encounteredError({
    required String errorMessage,
  }) = _EncounteredError;
}

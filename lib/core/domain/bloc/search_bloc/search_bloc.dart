import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/search/search.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.searchRepositoryImplementation,
  }) : super(
          const _Initial(),
        ) {
    on<_GetSearch>(
      (event, emit) async {
        final response = await searchRepositoryImplementation.getSearchTvShowOrMovie(event.tmdbQuery);

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<SearchModel> searchTvShowOrMovie = response.data?.toList() ?? [];
          emit(
            _LoadedSearch(searchTvShowOrMovie: searchTvShowOrMovie),
          );
        }
      },
    );
  }

  final TmdbRepositoryImplementation searchRepositoryImplementation;
}

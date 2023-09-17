import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/genres/genres.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

part 'genres_event.dart';
part 'genres_state.dart';
part 'genres_bloc.freezed.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  GenresBloc({required this.genresRepositoryImplementation})
      : super(
          const _Initial(),
        ) {
    on<_GetGenres>(
      (event, emit) async {
        final response = await genresRepositoryImplementation.getGenres(event.tmdbGenresFilter);

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<GenresModel> genres = response.data?.toList() ?? [];
          emit(
            _$_LoadedGenres(genres: genres),
          );
        }
      },
    );
  }
  final TmdbRepositoryImplementation genresRepositoryImplementation;
}

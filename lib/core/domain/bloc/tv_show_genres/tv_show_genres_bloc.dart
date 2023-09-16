import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/tv_show_genres/tv_show_genres.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

part 'tv_show_genres_event.dart';
part 'tv_show_genres_state.dart';
part 'tv_show_genres_bloc.freezed.dart';

class TvShowGenresBloc extends Bloc<TvShowGenresEvent, TvShowGenresState> {
  TvShowGenresBloc({required this.tvShowGenresRepositoryImplementation})
      : super(
          const _Initial(),
        ) {
    on<_GetTvShowGenres>(
      (event, emit) async {
        final response = await tvShowGenresRepositoryImplementation.getTvShowGenres(event.tvShowGenresFilter);

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<TvShowGenresModel> tvShowGenres = response.data?.toList() ?? [];
          emit(
            _$_LoadedTvShowGenres(tvShowGenres: tvShowGenres),
          );
        }
      },
    );
  }
  final TmdbRepositoryImplementation tvShowGenresRepositoryImplementation;
}

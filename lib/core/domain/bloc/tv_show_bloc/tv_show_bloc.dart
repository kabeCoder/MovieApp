import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

part 'tv_show_event.dart';
part 'tv_show_state.dart';
part 'tv_show_bloc.freezed.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  TvShowBloc({
    required this.tvShowRepositoryImplementation,
  }) : super(
          const _Initial(),
        ) {
    on<_GetTvShows>(
      (event, emit) async {
        final response = await tvShowRepositoryImplementation.getTvShows(
          event.tvShowsFilter,
          event.timeWindow,
        );

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<TvShowModel> tvShows = response.data?.toList() ?? [];
          emit(
            _LoadedTvShows(tvShow: tvShows),
          );
        }
      },
    );
  }

  final TmdbRepositoryImplementation tvShowRepositoryImplementation;
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

part 'similar_tv_show_event.dart';
part 'similar_tv_show_state.dart';
part 'similar_tv_show_bloc.freezed.dart';

class SimilarTvShowBloc extends Bloc<SimilarTvShowEvent, SimilarTvShowState> {
  SimilarTvShowBloc({
    required this.similarRepositoryImplementation,
  }) : super(
          const _Initial(),
        ) {
    on<_GetTvShowSimilar>(
      (event, emit) async {
        final response = await similarRepositoryImplementation.getSimilarTvShows(event.tmdbSimilarFilter, event.tvShowId);

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<TvShowModel> tvShowSimilar = response.data?.toList() ?? [];
          emit(
            _$_LoadedTvShowSimilar(tvShowSimilar: tvShowSimilar),
          );
        }
      },
    );
  }

  final TmdbRepositoryImplementation similarRepositoryImplementation;
}

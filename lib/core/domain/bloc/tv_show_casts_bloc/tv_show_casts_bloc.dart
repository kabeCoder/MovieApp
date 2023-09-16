import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/tv_show_casts/tv_show_casts.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';

part 'tv_show_casts_event.dart';
part 'tv_show_casts_state.dart';
part 'tv_show_casts_bloc.freezed.dart';

class TvShowCastsBloc extends Bloc<TvShowCastsEvent, TvShowCastsState> {
  TvShowCastsBloc({
    required this.tvShowCastsRepositoryImplementation,
  }) : super(const _Initial()) {
    on<_GetTvShowsCasts>(
      (event, emit) async {
        final response = await tvShowCastsRepositoryImplementation.getTvShowCasts(event.seriesId);

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<TvShowCastsModel> tvShowsCasts = response.data?.toList() ?? [];
          emit(
            _$_LoadedTvShowCasts(tvShowCasts: tvShowsCasts),
          );
        }
      },
    );
  }

  final TmdbRepositoryImplementation tvShowCastsRepositoryImplementation;
}

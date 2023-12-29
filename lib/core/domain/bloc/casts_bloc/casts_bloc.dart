import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/casts/casts.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

part 'casts_event.dart';
part 'casts_state.dart';
part 'casts_bloc.freezed.dart';

class CastsBloc extends Bloc<CastsEvent, CastsState> {
  CastsBloc({
    required this.castsRepositoryImplementation,
  }) : super(
          const _Initial(),
        ) {
    on<_GetCasts>(
      (event, emit) async {
        final response = await castsRepositoryImplementation.getCasts(event.tmdbCastsFilter, event.tmdbCastsId);

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<CastsModel> casts = response.data?.toList() ?? [];
          emit(
            _LoadedCasts(casts: casts),
          );
        }
      },
    );
  }

  final TmdbRepositoryImplementation castsRepositoryImplementation;
}

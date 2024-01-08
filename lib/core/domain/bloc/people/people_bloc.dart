import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/domain/models/people/people.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

part 'people_event.dart';
part 'people_state.dart';
part 'people_bloc.freezed.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  PeopleBloc({
    required this.peopleRepositoryImplementation,
  }) : super(const _Initial()) {
    on<_GetPeople>(
      (event, emit) async {
        final response = await peopleRepositoryImplementation.getPeople(
          event.tmdbPeopleFilter,
          event.timeWindow,
        );

        if (response.error != null) {
          emit(
            _EncounteredError(
              errorMessage: response.error ?? '',
            ),
          );
        } else {
          final List<PeopleModel> people = response.data?.toList() ?? [];
          emit(_LoadedPeople(people: people));
        }
      },
    );
  }

  final TmdbRepositoryImplementation peopleRepositoryImplementation;
}

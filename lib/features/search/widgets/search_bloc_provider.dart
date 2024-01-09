// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/people/people_bloc.dart';
import 'package:movie_app/core/domain/bloc/search_bloc/search_bloc.dart';
import 'package:movie_app/core/domain/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

class SearchBlocProvider extends StatelessWidget {
  SearchBlocProvider({
    Key? key,
    required this.child,
    this.tmdbQuery,
    this.timeWindow,
  }) : super(key: key);

  final Widget child;
  String? tmdbQuery;
  String? timeWindow;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          key: tmdbQuery != null && tmdbQuery!.isNotEmpty ? Key(tmdbQuery!) : null,
          create: (context) => SearchBloc(
            searchRepositoryImplementation: context.read<TmdbRepositoryImplementation>(),
          )..add(SearchEvent.getSearch(tmdbQuery ?? '')),
        ),
        BlocProvider(
          create: (context) => TvShowBloc(tvShowRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              const TvShowEvent.getTvShows(
                TmdbFilter.tv,
                '',
              ),
            ),
        ),
        BlocProvider(
          create: (_) => MovieBloc(
            movieRepositoryImplementation: context.read<TmdbRepositoryImplementation>(),
          )..add(
              const MovieEvent.getMovies(
                TmdbFilter.movie,
                '',
              ),
            ),
        ),
        BlocProvider(
          create: (_) => PeopleBloc(
            peopleRepositoryImplementation: context.read<TmdbRepositoryImplementation>(),
          )..add(
              PeopleEvent.getPeople(
                TmdbFilter.person,
                timeWindow ?? '',
              ),
            ),
        ),
      ],
      child: child,
    );
  }
}

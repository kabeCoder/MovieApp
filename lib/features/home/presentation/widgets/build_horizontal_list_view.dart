import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/domain/repositories/movie_repository_impl.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

class BuildHorizontalListView extends StatelessWidget {
  const BuildHorizontalListView({
    Key? key,
    required this.moviesFilter,
    required this.child,
  }) : super(key: key);

  final TmdbFilter moviesFilter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieBloc(
        movieRepositoryImplementation: context.read<MovieRepositoryImplementation>(),
      )..add(
          MovieEvent.getMovies(moviesFilter),
        ),
      child: child,
    );
  }
}

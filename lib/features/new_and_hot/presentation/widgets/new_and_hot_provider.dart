// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/domain/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:movie_app/core/domain/repositories/tmdb_repository_Implementation.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';

class NewAndHotBlocProvider extends StatelessWidget {
  NewAndHotBlocProvider({
    Key? key,
    required this.child,
    this.timeWindow,
  }) : super(key: key);

  final Widget child;
  String? timeWindow;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TvShowBloc(tvShowRepositoryImplementation: context.read<TmdbRepositoryImplementation>())
            ..add(
              TvShowEvent.getTvShows(
                TmdbFilter.tv,
                timeWindow ?? '',
              ),
            ),
        ),
        BlocProvider(
          create: (_) => MovieBloc(
            movieRepositoryImplementation: context.read<TmdbRepositoryImplementation>(),
          )..add(
              MovieEvent.getMovies(
                TmdbFilter.movie,
                timeWindow ?? '',
              ),
            ),
        ),
      ],
      child: child,
    );
  }
}

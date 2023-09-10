import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/core/domain/repositories/movie_repository_impl.dart';
import 'package:movie_app/core/domain/utils/enums/movies_filter.dart';
import 'package:movie_app/features/home/presentation/widgets/movies_list_view.dart';

@RoutePage()
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (_) => MovieBloc(
        movieRepositoryImplementation: context.read<MovieRepositoryImplementation>(),
      )..add(
          const MovieEvent.getMovies(
            MoviesFilter.discover,
          ),
        ),
      child: const MoviesListView(),
    ));
  }
}

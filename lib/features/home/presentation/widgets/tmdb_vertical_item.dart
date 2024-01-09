// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/people/people.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';

class TmdbVerticalItem extends StatelessWidget {
  TmdbVerticalItem({
    super.key,
    required this.collection,
    this.movie,
    this.tvShow,
    this.people,
  });

  final String collection;
  MovieModel? movie;
  TvShowModel? tvShow;
  PeopleModel? people;

  @override
  Widget build(BuildContext context) {
    final imageUrl = (collection == context.l10n.collection_movie)
        ? movie?.posterUrl
        : (collection == context.l10n.collection_tv_show)
            ? tvShow?.posterUrl
            : people?.profilePath;
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              child: AppCachedNetworkImage(
                imageUrl: imageUrl!,
              ),
            ),
            const SizedBox(height: 8),
            if (collection == context.l10n.collection_people)
              Text(
                people!.name,
                style: const TextStyle(color: ColorConstants.deepPurpleLight),
              )
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    if (collection == context.l10n.collection_movie) {
      context.pushRoute(
        DetailsRoute(
          collection: collection,
          movie: movie,
        ),
      );
    } else if (collection == context.l10n.collection_tv_show) {
      context.pushRoute(
        DetailsRoute(
          collection: collection,
          tvShow: tvShow,
        ),
      );
    } else {}
  }
}

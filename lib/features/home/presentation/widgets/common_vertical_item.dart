// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';

class CommonVerticalItem extends StatelessWidget {
  CommonVerticalItem({
    super.key,
    required this.collection,
    this.movie,
    this.tvShow,
  });

  final String collection;
  MovieModel? movie;
  TvShowModel? tvShow;

  @override
  Widget build(BuildContext context) {
    final imageUrl = (collection == context.l10n.collection_movie) ? movie?.posterUrl : tvShow?.posterUrl;
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        child: SizedBox(
          width: 120,
          child: AppCachedNetworkImage(
            imageUrl: imageUrl!,
          ),
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
    } else {
      context.pushRoute(
        DetailsRoute(
          collection: collection,
          tvShow: tvShow,
        ),
      );
    }
  }
}

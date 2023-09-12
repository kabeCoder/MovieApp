// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  DetailsScreen({
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
    final backdropUrl = (collection == context.l10n.collection_movie) ? movie?.backdropUrl : tvShow?.backdropUrl;
    final description = (collection == context.l10n.collection_movie) ? movie?.description : tvShow?.description;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Details',
          style: TextStyles.bodyText1,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: ColorConstants.deepPurpleLight,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                AppCachedNetworkImage(
                  imageUrl: backdropUrl!,
                  opacity: 0.4,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Overview: ',
                style: TextStyles.bodyText1.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description!,
                style: TextStyles.bodyText2.copyWith(
                  fontSize: 12,
                  color: ColorConstants.deepPurpleLight,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

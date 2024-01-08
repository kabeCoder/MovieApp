import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';

// ignore: must_be_immutable
class TmdbHorizontalItem extends StatelessWidget {
  TmdbHorizontalItem({
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
    final imageUrl = (collection == context.l10n.collection_tv_show) ? tvShow?.backdropUrl : movie?.backdropUrl;
    final title = (collection == context.l10n.collection_tv_show) ? tvShow?.name : movie?.title;

    return GestureDetector(
      onTap: () => _onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 120,
              child: AppCachedNetworkImage(
                imageUrl: imageUrl!,
                boxFit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  title!,
                  style: TextStyles.headline2.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
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

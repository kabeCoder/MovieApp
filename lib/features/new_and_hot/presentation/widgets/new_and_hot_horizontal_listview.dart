// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/routes/app_router.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';
import 'package:movie_app/features/common_widgets/common_text_view.dart';
import 'package:readmore/readmore.dart';

class NewAndHotHorizonalListView extends StatelessWidget {
  NewAndHotHorizonalListView({
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
    final title = (collection == context.l10n.collection_movie) ? movie?.title : tvShow?.name;
    final imageUrl = (collection == context.l10n.collection_movie) ? movie?.backdropUrl : tvShow?.backdropUrl;
    final overview = (collection == context.l10n.collection_movie) ? movie?.overview : tvShow?.overview;

    return GestureDetector(
      onTap: () => _onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 16,
        ),
        child: Column(
          children: [
            CommonTextView(
              alignment: Alignment.centerLeft,
              child: Text(
                title!,
                style: TextStyles.bodyText1.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 8),
            AppCachedNetworkImage(
              imageUrl: imageUrl!,
              opacity: 1.0,
            ),
            const SizedBox(height: 8),
            CommonTextView(
              alignment: Alignment.centerLeft,
              child: ReadMoreText(
                overview!.isEmpty ? context.l10n.label_no_overview : overview,
                trimLines: 2,
                colorClickableText: ColorConstants.white1,
                trimMode: TrimMode.Line,
                trimCollapsedText: context.l10n.label_more,
                trimExpandedText: context.l10n.label_less,
                style: TextStyles.bodyText2.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: ColorConstants.deepPurpleLight,
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

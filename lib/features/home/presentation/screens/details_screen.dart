// ignore_for_file: must_be_immutable, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/bloc/tv_show_casts_bloc/tv_show_casts_bloc.dart';
import 'package:movie_app/core/domain/models/movie/movie.dart';
import 'package:movie_app/core/domain/models/tv_show/tv_show.dart';
import 'package:movie_app/core/presentation/widgets/app_cached_network_image.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/home/presentation/widgets/common_button.dart';
import 'package:movie_app/features/home/presentation/widgets/common_text_view.dart';
import 'package:movie_app/features/home/presentation/widgets/home_bloc_provider.dart';
import 'package:movie_app/features/home/utils/home_constants.dart';
import 'package:readmore/readmore.dart';

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
    final overview = (collection == context.l10n.collection_movie) ? movie?.overview : tvShow?.overview;
    final title = (collection == context.l10n.collection_movie) ? movie?.title : tvShow?.name;
    final popularity = (collection == context.l10n.collection_movie) ? movie?.popularity : tvShow?.popularity;

    final id = (collection == context.l10n.collection_movie) ? movie?.id : tvShow?.id;
    final int maxPopularity;
    String? popularityPercentage;

    if (popularity! >= 0 && popularity <= 1000) {
      maxPopularity = HomeConstants.oneKMax;
    } else if (popularity <= 2000) {
      maxPopularity = HomeConstants.twoKMax;
    } else if (popularity <= 3000) {
      maxPopularity = HomeConstants.threeKMax;
    } else if (popularity <= 4000) {
      maxPopularity = HomeConstants.fourKMax;
    } else if (popularity <= 5000) {
      maxPopularity = HomeConstants.fourKMax;
    } else if (popularity <= 6000) {
      maxPopularity = HomeConstants.fourKMax;
    } else if (popularity <= 7000) {
      maxPopularity = HomeConstants.fourKMax;
    } else if (popularity <= 8000) {
      maxPopularity = HomeConstants.fourKMax;
    } else if (popularity <= 9000) {
      maxPopularity = HomeConstants.fourKMax;
    } else if (popularity <= 10000) {
      maxPopularity = HomeConstants.fourKMax;
    } else {
      maxPopularity = popularity.toInt();
    }

    popularityPercentage = '${((popularity / maxPopularity) * 100).toStringAsFixed(0)}%';

    return Scaffold(
      appBar: AppBar(
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
                  opacity: 1.0,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/netflix.png',
                  scale: 30,
                ),
                Column(
                  children: [
                    CommonTextView(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.l10n.label_series.toUpperCase(),
                        style: TextStyles.bodyText2.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 3.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
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
            CommonTextView(
              alignment: Alignment.centerLeft,
              child: Text(
                '$popularityPercentage ${context.l10n.label_popularity}',
                style: TextStyles.bodyText1.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.white1,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            CommonButton(
              buttonText: context.l10n.label_play,
              buttonTextStyle: TextStyles.bodyText2.copyWith(
                fontWeight: FontWeight.w600,
              ),
              buttonRadius: 5.0,
              width: double.infinity,
              leadingIcon: const Icon(
                Icons.play_arrow,
              ),
              iconTextSpacing: 4,
              onTap: () {},
            ),
            CommonButton(
              buttonText: context.l10n.label_download,
              buttonTextStyle: TextStyles.bodyText2.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorConstants.white1,
              ),
              buttonBackGroundColor: ColorConstants.grey1,
              buttonRadius: 5.0,
              width: double.infinity,
              leadingIcon: const Icon(
                Icons.download,
                color: ColorConstants.white1,
              ),
              iconTextSpacing: 4,
              onTap: () {},
            ),
            const SizedBox(height: 8),
            CommonTextView(
              alignment: Alignment.centerLeft,
              child: Text(
                overview!,
                style: TextStyles.bodyText2.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: ColorConstants.deepPurpleLight,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            if (collection == context.l10n.collection_tv_show)
              HomeBlocProvider(
                seriesId: id,
                child: BlocConsumer<TvShowCastsBloc, TvShowCastsState>(
                  listener: (context, state) => state.whenOrNull(
                    encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(errorMessage),
                      ),
                    ),
                  ),
                  builder: (_, state) => state.maybeWhen(
                    loadingTvShowsCasts: () => const Center(
                      child: AppCircularProgressIndicator(),
                    ),
                    loadedTvShowsCasts: (tvShowsCasts) => CommonTextView(
                      alignment: Alignment.centerLeft,
                      child: ReadMoreText(
                        tvShowsCasts.isEmpty
                            ? '${context.l10n.label_cast}: ${context.l10n.label_not_available}'
                            : '${context.l10n.label_cast}: ${tvShowsCasts.map((tvShowCast) => tvShowCast.name).join(', ')}',
                        trimLines: 2,
                        colorClickableText: ColorConstants.white1,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: context.l10n.label_more,
                        trimExpandedText: context.l10n.label_less,
                        style: TextStyles.bodyText2.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    orElse: SizedBox.shrink,
                  ),
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.label_genres,
                style: TextStyles.bodyText1.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.list_alt_outlined,
                      color: ColorConstants.deepPurpleLight,
                    ),
                    Text(
                      'My List',
                      style: TextStyles.bodyText2,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.thumbs_up_down_outlined,
                      color: ColorConstants.deepPurpleLight,
                    ),
                    Text(
                      'My List',
                      style: TextStyles.bodyText2,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: ColorConstants.deepPurpleLight,
                    ),
                    Text(
                      'Share',
                      style: TextStyles.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

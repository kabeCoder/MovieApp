import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/bloc/video_bloc/video_bloc.dart';
import 'package:movie_app/core/domain/utils/enums/tmdb_filter.dart';
import 'package:movie_app/core/presentation/widgets/app_circular_progress_indicator.dart';
import 'package:movie_app/features/details/presentation/widgets/details_bloc_provider.dart';
import 'package:movie_app/features/details/presentation/widgets/tmdb_video_item.dart';

class TmdbVideoBottomSheetContents extends StatelessWidget {
  const TmdbVideoBottomSheetContents({
    super.key,
    required this.collection,
    required this.tmdbFilter,
    required this.id,
  });

  final String collection;
  final TmdbFilter tmdbFilter;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: DetailsBlocProvider(
        tmdbFilter: tmdbFilter,
        tmdbVideoId: id,
        child: BlocConsumer<VideoBloc, VideoState>(
          listener: (context, state) => state.whenOrNull(
            encounteredError: (errorMessage) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
              ),
            ),
          ),
          builder: (_, state) => state.maybeWhen(
            loadingVideos: () => const Center(
              child: AppCircularProgressIndicator(),
            ),
            loadedVideos: (tmdbVideos) => Column(
              children: [
                const SizedBox(height: 8),
                const SizedBox(
                  width: 50,
                  child: Center(
                    child: Divider(
                      color: ColorConstants.white1,
                      thickness: 2.0,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                tmdbVideos.isEmpty
                    ? Column(
                        children: [
                          Container(
                            color: Colors.black,
                            width: double.infinity,
                            height: 250,
                            child: Center(
                              child: Text(
                                context.l10n.label_no_video_available,
                                style: TextStyles.bodyText1.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Expanded(
                        child: TmdbVideoItem(
                          video: tmdbVideos.first,
                          videoLists: tmdbVideos,
                        ),
                      ),
              ],
            ),
            orElse: SizedBox.shrink,
          ),
        ),
      ),
    );
  }
}

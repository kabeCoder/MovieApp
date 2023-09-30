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
      backgroundColor: ColorConstants.white1,
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
            loadedVideos: (tmdbVideos) => tmdbVideos.isEmpty
                ? Container(
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
                  )
                : TmdbVideoItem(
                    video: tmdbVideos.first,
                    videoLists: tmdbVideos,
                  ),
            orElse: SizedBox.shrink,
          ),
        ),
      ),
    );
  }
}


// tmdbVideos.isEmpty
//                 ? Container(
//                     color: Colors.black,
//                     width: double.infinity,
//                     height: 250,
//                     child: Center(
//                       child: Text(
//                         context.l10n.label_no_video_available,
//                         style: TextStyles.bodyText1.copyWith(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   )
//                 : Column(
//                     children: [
//                       if (collection == context.l10n.collection_tv_show)
//                         TmdbVideoItem(
//                           video: tmdbVideos.first,
//                         ),
//                       for (final tmdbVideo in tmdbVideos)
//                         if (collection == context.l10n.collection_movie)
//                           TmdbVideoItem(
//                             video: tmdbVideo,
//                           ),
//                     ],
//                   ),
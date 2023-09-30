import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/text_styles.dart';
import 'package:movie_app/core/domain/models/video/video.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TmdbVideoItem extends StatefulWidget {
  const TmdbVideoItem({
    super.key,
    required this.video,
    required this.videoLists,
  });

  final VideoModel video;
  final List<VideoModel> videoLists;

  @override
  State<TmdbVideoItem> createState() => _TmdbVideoItemState();
}

class _TmdbVideoItemState extends State<TmdbVideoItem> {
  late YoutubePlayerController _controller;
  String? selectedVideoId;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.key,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 250,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.videoLists.length,
            itemBuilder: (_, int index) {
              final videoList = widget.videoLists[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedVideoId = videoList.key;
                  });
                  _controller.load(selectedVideoId!);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 120,
                        child: Image.network('https://img.youtube.com/vi/${videoList.key}/0.jpg'),
                      ),
                      Expanded(
                        child: Text(
                          videoList.name,
                          style: TextStyles.bodyText1.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

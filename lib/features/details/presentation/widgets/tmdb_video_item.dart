import 'package:flutter/material.dart';
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
          child: _playSingleYoutubeVideo(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.videoLists.length,
            itemBuilder: (_, int index) {
              final videoList = widget.videoLists[index];
              return Row(
                children: [
                  Text(videoList.name),
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget _playSingleYoutubeVideo() {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
}

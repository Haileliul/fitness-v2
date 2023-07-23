import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtubplayer extends StatelessWidget {
  late String myVideoId;
  youtubplayer({
    super.key,
    required this.myVideoId,
  });
  loader(String myVideoId) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: myVideoId,
      flags: const YoutubePlayerFlags(
        // autoPlay: true,

        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: false,
        /*  enableCaption: true, */
        hideThumbnail: true,
      ),
    );

    return controller;
  }

  // the full url: https://www.youtube.com/watch?v=PQSagzssvUQ&ab_channel=NASA

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: YoutubePlayer(
        controller: loader(myVideoId),
      ),
    );
  }
}

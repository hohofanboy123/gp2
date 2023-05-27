import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeExerciseVideo extends StatefulWidget {
  final String vidurl;
  const YoutubeExerciseVideo({super.key, required this.vidurl});

  @override
  State<YoutubeExerciseVideo> createState() => _YoutubeExerciseVideoState();
}

class _YoutubeExerciseVideoState extends State<YoutubeExerciseVideo> {
  late YoutubePlayerController cont;

  @override
  void initState() {
    String url = widget.vidurl;
    cont = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      )
      );
    super.initState();
  }

  @override
  void deactivate() {
    cont.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    cont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: cont,
        ),
      builder: (context, player) => SizedBox(
        height: 50,
        child: player)
      );
  }
}
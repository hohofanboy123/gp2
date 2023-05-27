import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:fexercise/view/widget/youtube_player.dart';
import 'package:flutter/material.dart';

class YoutubeContainer extends StatelessWidget {
  final String vidurl;
  const YoutubeContainer({super.key, required this.vidurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blue2.withOpacity(0.5),
            spreadRadius: 2.5,
            blurRadius: 5,
            offset: const Offset(0, 5)
          )
        ],
        color: blue2,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)
        )
      ),
                    margin: const EdgeInsets.all(15),
                    //padding: EdgeInsets.all(15),
                    height: 200,
                    child: YoutubeExerciseVideo(vidurl: vidurl,)
                );
  }
}
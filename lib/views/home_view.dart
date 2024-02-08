import 'package:flutter/material.dart';
import 'package:youtube/widgets/audio_card.dart';
import 'package:youtube/widgets/video_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black.withOpacity(0.95),
      height: size.height * 0.94,
      width: size.width * 0.9,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: [
            VideoCard(),
            AudioCard()
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  final String videourl;
  const VideoListItem({super.key, required this.index, required this.videourl});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _videoPlayerController;
  bool isVolume = true;
  bool isPlay = true;

  @override
  void initState() {
    super.initState();
    videoController(videoPath: videoPathList[widget.index]);
  }

  void videoController({required String videoPath}) {
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(videoPath);
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _videoPlayerController.play();
        _videoPlayerController.setVolume(isVolume ? 1.0 : 0.0);
      });
    });
  }

  void toggleVolume() {
    setState(() {
      isVolume = !isVolume;
      _videoPlayerController.setVolume(isVolume ? 1.0 : 0.0);
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _videoPlayerController.value.isInitialized
            ? Center(
                child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 28,
                  child: IconButton(
                    onPressed: toggleVolume,
                    icon: Icon(
                      isVolume ? Icons.volume_up : Icons.volume_off,
                      size: 28,
                      color: kwhitecolor,
                    ),
                  ),
                ),
                // Right side
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://resizing.flixster.com/CCTwucvqizkxoWsRKclAQauBRAQ=/206x305/v2/https://resizing.flixster.com/2bpFxoybigCD78l_tMP4wE7m6j4=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2IwMmU1NmEwLTM0MzQtNDYzMC1iNWExLWFiMmNiMzRkNzcwZC5qcGc=",
                        ),
                      ),
                    ),
                    VideActionsWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideActionsWidget(icon: Icons.add, title: 'My List'),
                    VideActionsWidget(icon: Icons.share, title: 'Share'),
                    VideActionsWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideActionsWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhitecolor,
            size: 28,
          ),
          Text(
            title,
            style: const TextStyle(color: kwhitecolor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

List<String> videoPathList = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];

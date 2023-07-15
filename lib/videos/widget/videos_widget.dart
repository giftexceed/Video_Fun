import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String url;
  const VideoWidget({super.key, required this.url});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController videoPlayerController;
  late Future<void> _initPlayerFuture;
  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url));
    _initPlayerFuture = videoPlayerController.initialize().then((value) {
      setState(() {});
    });
    videoPlayerController.setLooping(true);
    videoPlayerController.play();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return videoPlayerController.value.isInitialized
                ? SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: videoPlayerController.value.size.width,
                        height: videoPlayerController.value.size.height,
                        child: VideoPlayer(videoPlayerController),
                      ),
                    ),
                  )
                : Container();
          } else {
            return Container();
          }
        });
  }
}

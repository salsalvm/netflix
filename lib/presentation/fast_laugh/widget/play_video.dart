
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final List<String> videos;
  final index;
  final void Function(bool isPlaying) onStateChanged;
  const Video({
    Key? key,
    required this.index,
    required this.videos,
    required this.onStateChanged,
  }) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    _videoController = VideoPlayerController.network(
        widget.videos[widget.index % widget.videos.length]);
    _videoController.initialize().then((value) {
      setState(() {
        _videoController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : Center(child: CircularProgressIndicator()));
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}

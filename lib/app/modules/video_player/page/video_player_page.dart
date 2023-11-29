import 'package:flutter/material.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/controller/video_player_controller.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/background_widget.dart';

class VideoPlayerPage extends StatefulWidget {
  final String token;
  const VideoPlayerPage({super.key, required this.token});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController controller = VideoPlayerController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getVideoUrl(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return const BackgroundWidget(child: Column());
  }
}

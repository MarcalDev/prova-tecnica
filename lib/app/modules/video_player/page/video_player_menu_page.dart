import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/controller/video_player_menu_controller.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/page/widgets/video_player_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/background_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerMenuPage extends StatefulWidget {
  const VideoPlayerMenuPage({super.key});

  @override
  State<VideoPlayerMenuPage> createState() => _VideoPlayerMenuPageState();
}

class _VideoPlayerMenuPageState extends State<VideoPlayerMenuPage> {
  late String token;
  late VideoPlayerMenuController controller = VideoPlayerMenuController();

  // late ChewieController _chewieController;
  @override
  initState() {
    super.initState();
    controller.onInit();
    // _videoController = VideoPlayerController.network(
    //     'https://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8');

    // _chewieController = ChewieController(
    //   videoPlayerController: _videoController,
    //   aspectRatio: 3 / 2,
    //   autoPlay: true,
    //   looping: true,
    // );

    // controller.getVideoUrl(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return const BackgroundWidget(
        child: Column(
      children: [
        VideoPlayerWidget(
            videoUrl:
                'https://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8'),
      ],
    ));
  }
}

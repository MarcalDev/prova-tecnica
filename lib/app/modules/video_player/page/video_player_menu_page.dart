import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/controller/video_player_menu_controller.dart';
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
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;
  @override
  initState() {
    super.initState();
    controller.onInit();
    _videoController = VideoPlayerController.network(
        'https://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8');
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
    _videoController.addListener(() {
      setState(() {});
    });
    _videoController.initialize();
    _videoController.play();
    // controller.getVideoUrl(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Column(
      children: [
        Container(
          height: 250,
          child: Chewie(
            controller: _chewieController,
            // Obx(() => controller.urlVideo.isNotEmpty
            //         ? VideoPlayer(VideoPlayerController.contentUri(
            //             Uri.parse("https://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8")))
            //         : const SizedBox()
            // Visibility(
            //     visible: controller.urlVideo != null,
            //     child: VideoPlayer(VideoPlayerController.contentUri(
            //         Uri.parse(controller.urlVideo!)))),
          ),
        )
      ],
    ));
  }
}

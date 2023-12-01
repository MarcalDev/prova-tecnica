import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/controller/video_player_menu_controller.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/page/widgets/video_player_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/background_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/button_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerMenuPage extends StatefulWidget {
  const VideoPlayerMenuPage({super.key});

  @override
  State<VideoPlayerMenuPage> createState() => _VideoPlayerMenuPageState();
}

class _VideoPlayerMenuPageState extends State<VideoPlayerMenuPage> {
  late VideoPlayerMenuController controller = VideoPlayerMenuController();

  @override
  initState() {
    super.initState();
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Column(
      children: [
        Obx(() => controller.urlVideo.isNotEmpty
            ? VideoPlayerWidget(videoUrl: controller.urlVideo)
            : Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ButtonWidget(
                        width: 50.w,
                        height: 5.5.h,
                        buttonColor: Colors.blue,
                        textColor: Colors.white,
                        isLoading: controller.isLoading,
                        buttonText: 'Carregar vídeo',
                        onPressed: () async => await controller.getVideoUrl(),
                      ),
                    ],
                  ),
                ),
              )),
      ],
    ));
  }
}

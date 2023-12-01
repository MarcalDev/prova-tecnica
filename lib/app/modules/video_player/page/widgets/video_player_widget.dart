import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/button_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late RxBool _isPlaying;
  late RxBool _isFullScreen;
  late RxBool _isLoading;
  late RxDouble _screenSize;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _isPlaying = false.obs;
    _isFullScreen = false.obs;
    _isLoading = true.obs;
    _screenSize = 50.w.obs;
    _videoController = VideoPlayerController.network(widget.videoUrl);
    _videoController.addListener(() {
      setState(() {});
    });
    _videoController.initialize().then((value) {
      setState(() {
        _isLoading.value = false;
        _isLoading.refresh();
      });
    });
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  bool get isPlaying => _isPlaying.value;
  bool get isFullScreen => _isFullScreen.value;
  double get screenSize => _screenSize.value;
  bool get isLoading => _isLoading.value;

  playPauseVideo() async {
    if (isLoading) return;
    isPlaying ? await _videoController.pause() : await _videoController.play();
    _isPlaying.value = !isPlaying;
    _isPlaying.refresh();
  }

  changeFullScreen() {
    if (isFullScreen) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
      // _screenSize.value = 100.w;
      // _screenSize.refresh();
    }
    _isFullScreen.value = !_isFullScreen.value;
    _isFullScreen.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: !isFullScreen,
        onPopInvoked: (value) {
          if (isFullScreen) changeFullScreen();
        },
        child: Flexible(
          fit: isFullScreen ? FlexFit.tight : FlexFit.loose,
          child: SizedBox(
            height: isFullScreen ? null : 25.h,
            child: Stack(
              children: [
                VideoPlayer(_videoController),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.black.withOpacity(0.5))),
                        onPressed: () async => await playPauseVideo(),
                        icon: Icon(
                          isPlaying
                              ? Icons.pause_outlined
                              : Icons.play_arrow_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.black.withOpacity(0.5))),
                        onPressed: () => changeFullScreen(),
                        icon: Icon(
                          isFullScreen
                              ? Icons.fullscreen_exit
                              : Icons.fullscreen,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLoading)
                  const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

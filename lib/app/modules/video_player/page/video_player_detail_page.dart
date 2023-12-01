import 'package:flutter/material.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/background_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';
import 'package:seventh_prova_tecnica/app/util/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seventh_prova_tecnica/app/util/text_fonts.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerDetailPage extends StatefulWidget {
  final String urlVideo;
  const VideoPlayerDetailPage({super.key, required this.urlVideo});

  @override
  State<VideoPlayerDetailPage> createState() => _VideoPlayerDetailPageState();
}

class _VideoPlayerDetailPageState extends State<VideoPlayerDetailPage> {
  late RxBool _isPlaying;
  late RxBool _isFullScreen;
  late RxBool _isLoading;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _isPlaying = true.obs;
    _isFullScreen = false.obs;
    _isLoading = true.obs;
    _videoController = VideoPlayerController.network(
      widget.urlVideo,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _videoController.addListener(() {
      setState(() {});
    });
    _videoController.initialize().then((value) {
      setState(() {
        _isLoading.value = false;
        _isLoading.refresh();
        _videoController.play();
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
    }
    _isFullScreen.value = !_isFullScreen.value;
    _isFullScreen.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Container(
            color: AppColors.backgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => !isFullScreen
                      ? Container(
                          color: AppColors.grayColor,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () => Get.back(),
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.whiteColor,
                                  )),
                              Flexible(
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(1.w, 2.h, 2.w, 2.h),
                                  child: TextWidget(
                                    text: widget.urlVideo,
                                    fontSize: TextFonts.smallTextFont,
                                    textColor: AppColors.whiteColor,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
                Obx(
                  () => PopScope(
                    canPop: !isFullScreen,
                    onPopInvoked: (value) {
                      if (isFullScreen) {
                        changeFullScreen();
                      } else {
                        _videoController.pause();
                      }
                    },
                    child: Flexible(
                      fit: isFullScreen ? FlexFit.tight : FlexFit.loose,
                      child: Stack(
                        children: [
                          Container(
                            color: AppColors.blackColor,
                            child: Center(
                              child: AspectRatio(
                                aspectRatio: _videoController.value.aspectRatio,
                                child: VideoPlayer(
                                  _videoController,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                VideoProgressIndicator(_videoController,
                                    allowScrubbing: true,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    colors: const VideoProgressColors(
                                        backgroundColor: AppColors.grayColor,
                                        playedColor: Colors.blue)),
                                SizedBox(
                                  height: isFullScreen ? 1.h : 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(Colors
                                                  .black
                                                  .withOpacity(0.5))),
                                      onPressed: () async =>
                                          await playPauseVideo(),
                                      icon: Icon(
                                        isPlaying
                                            ? Icons.pause_outlined
                                            : Icons.play_arrow_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(Colors
                                                  .black
                                                  .withOpacity(0.5))),
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
                                SizedBox(
                                  height: isFullScreen ? 2.h : 3.h,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

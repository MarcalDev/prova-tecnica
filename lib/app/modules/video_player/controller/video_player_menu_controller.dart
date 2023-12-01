import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/page/video_player_detail_page.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/error_popup_widget.dart';
import 'package:seventh_prova_tecnica/base/services/video_service.dart';

class VideoPlayerMenuController extends RxController {
  late final RxString _urlVideo;
  late final RxBool _isLoading;
  late final RxBool _isExitPressed;

  controllerInitializer() async {
    _urlVideo = "".obs;
    _isLoading = false.obs;
    _isExitPressed = false.obs;
  }

  @override
  void onInit() async {
    super.onInit();
    controllerInitializer();
  }

  String get urlVideo => _urlVideo.value;
  bool get isLoading => _isLoading.value;
  bool get isExitPressed => _isExitPressed.value;

  getVideoUrl(BuildContext context) async {
    try {
      if (isLoading) return;
      var videoUrl = await VideoService().getVideo('bunny.mp4');
      _urlVideo.value = videoUrl!;
      _urlVideo.refresh();

      Get.to(() => VideoPlayerDetailPage(
            urlVideo: urlVideo,
          ));
    } catch (e) {
      ErrorPopup.openPopup(context, "Não foi possível carregar o vídeo");
    }
  }

  void popPage(BuildContext context) async {
    if (isExitPressed) return SystemNavigator.pop();
    var snackBar = const SnackBar(
      content: Text('Pressione voltar novamente para sair'),
    );
    _isExitPressed.value = true;
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar)
        .closed
        .then((value) => _isExitPressed.value = false);
  }
}

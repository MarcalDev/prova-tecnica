import 'package:get/get.dart';
import 'package:seventh_prova_tecnica/base/services/video_service.dart';

class VideoPlayerController extends RxController {
  late final VideoService _videoService;
  // late final String _token;
  controllerInitializer() {}

  // VideoPlayerController(_token);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controllerInitializer();
  }

  getVideoUrl(String token) async {
    _videoService = VideoService();
    var videoUrl = await _videoService.getVideo(token, 'bunny.mp4');
    print(videoUrl);
  }
}

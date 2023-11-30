import 'package:get/get.dart';
import 'package:seventh_prova_tecnica/base/services/video_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoPlayerMenuController extends RxController {
  late final VideoService _videoService;
  late final RxString _urlVideo;
  late final SharedPreferences sharedPreferences;

  controllerInitializer() async {
    _urlVideo = "".obs;
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void onInit() async {
    super.onInit();
    controllerInitializer();
    await getVideoUrl();
  }

  String get urlVideo => _urlVideo.value;

  getVideoUrl() async {
    _videoService = VideoService();
    var videoUrl = await _videoService.getVideo('bunny.mp4');
    _urlVideo.value = videoUrl;
    _urlVideo.refresh();
  }
}

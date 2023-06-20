import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class StreamController extends GetxController {
  var data = Get.arguments;

  final abc = "".obs;
  ChewieController? chewieController;
  RxDouble brightnessValue = 0.5.obs;
  RxDouble volumeValue = 0.5.obs;

  setVolume(double value) {
    volumeValue.value = value;
    update();
  }

  setBrightness(double value) {
    brightnessValue.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.file(data),
        autoPlay: true,
        showControlsOnInitialize: true,
        looping: false,
        allowFullScreen: true,
        showControls: true);
  }
}

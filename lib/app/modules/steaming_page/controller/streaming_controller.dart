import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:video_player/video_player.dart';

class StreamController extends GetxController {
  var data = Get.arguments;

  final abc = "".obs;
  ChewieController? chewieController;
  RxDouble brightnessValue = 0.5.obs;
  RxDouble volumeValue = 0.5.obs;

  setVolume(double value) async {
    volumeValue.value = value;
    await PerfectVolumeControl.setVolume(volumeValue.value);
    update();
  }

  Future<void> setBrightness(double value) async {
    brightnessValue.value = value;
    try {
      await ScreenBrightness().setScreenBrightness(brightnessValue.value);
    } catch (e) {
      print(e);
      throw 'Failed to set brightness';
    }
  }

  Future<void> resetBrightness() async {
    try {
      await ScreenBrightness().resetScreenBrightness();
    } catch (e) {
      print(e);
      throw 'Failed to reset brightness';
    }
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

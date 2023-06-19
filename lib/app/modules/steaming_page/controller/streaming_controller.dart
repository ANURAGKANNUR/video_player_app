import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class StreamController extends GetxController {
  var data = Get.arguments;

  final abc = "".obs;
 // VideoPlayerController? playerController;
  ChewieController? chewieController;



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

import 'package:get/get.dart';
import 'package:video_app/app/modules/video_info/controller/video_info_controller.dart';

class VideoInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VideoInfoController());
  }
}

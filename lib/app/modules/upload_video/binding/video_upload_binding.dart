import 'package:get/get.dart';

import '../controller/video_upload_controller.dart';

class VideoUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VideoUploadController());
  }
}

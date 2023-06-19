

import 'package:get/get.dart';
import 'package:video_app/app/modules/steaming_page/controller/streaming_controller.dart';

class StreamPageBinding extends Bindings{

  @override
  void dependencies() {

    Get.put(StreamController());
  }
}
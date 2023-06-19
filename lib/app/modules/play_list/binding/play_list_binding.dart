

import 'package:get/get.dart';
import 'package:video_app/app/modules/play_list/controller/play_list_controller.dart';

class PlayListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PlayListController());
  }


}
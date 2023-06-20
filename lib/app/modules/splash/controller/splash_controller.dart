import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_app/app/modules/play_list/controller/play_list_controller.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final playListController = Get.put(PlayListController());
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      Get.offAllNamed(Routes.playList);
      // }
    });
  }
}

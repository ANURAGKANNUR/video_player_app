


import 'package:get/get.dart';
import 'package:video_app/app/modules/play_list/controller/play_list_controller.dart';

import '../../../routes/app_pages.dart';
class SplashController extends GetxController{

  final playListController=Get.put(PlayListController());

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      // if ((await _repository.getToken()).isNotEmpty) {
      //   Get.offAllNamed(Routes.landing);
      // } else {
      Get.offAllNamed(Routes.playList);
      // }
    });
  }

}
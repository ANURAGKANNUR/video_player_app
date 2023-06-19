
import 'package:video_app/app/modules/splash/binding/splash_binding.dart';
import 'package:video_app/app/modules/splash/views/splash_screen_page.dart';
import 'package:video_app/app/modules/steaming_page/views/streaming_page.dart';
import 'package:video_app/app/modules/video_info/binding/video_info_binding.dart';
import 'package:video_app/app/modules/video_info/views/video_info_page.dart';

import '../modules/play_list/binding/play_list_binding.dart';
import '../modules/play_list/views/play_list.dart';
import '../modules/steaming_page/binding/stream_binding.dart';
import '../modules/upload_video/binding/video_upload_binding.dart';
import '../modules/upload_video/views/video_upload.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial =Routes.splashScreenPage;

  static final routes = [
    GetPage(name: _Paths.playList, page: () => PlayList(),binding: PlayListBinding()),
    GetPage(name: _Paths.videoUpload, page: ()=>VideoUpload(),binding: VideoUploadBinding()),
    GetPage(name: _Paths.streamPage, page: ()=>StreamPage(),binding: StreamPageBinding()),
    GetPage(name: _Paths.splashScreenPage, page: ()=>SplashScreenPage(),binding: SplashBinding()),
    GetPage(name: _Paths.videoInfoPage, page:()=>VideoInfoPage(),binding: VideoInfoBinding())
  ];
}

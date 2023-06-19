part of '../../app/routes/app_pages.dart';

abstract class Routes {
  Routes._();
  static const playList = _Paths.playList;
  static const videoUpload = _Paths.videoUpload;
  static const streamPage=_Paths.streamPage;
  static const splashScreenPage=_Paths.splashScreenPage;
  static const videoInfoPage=_Paths.videoInfoPage;
}

abstract class _Paths {
  _Paths._();

  static const playList = '/playList';
  static const videoUpload = '/videoUpload';
  static const streamPage='/streamPage';
  static const splashScreenPage='/splashScreenPage';
  static const  videoInfoPage='/videoInfoPage';
}

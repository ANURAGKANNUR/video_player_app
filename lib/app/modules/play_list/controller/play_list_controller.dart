import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path/path.dart' as path;

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class PlayListController extends GetxController {
  var videoFiles = List<File>.empty().obs;
  var selectedOption = ''.obs;
  final Permission _storagePermission = Permission.storage;
  var permissionStatus=''.obs;
  var currentStatus=''.obs;
  final FlutterFFprobe _flutterFFprobe = new FlutterFFprobe();


  @override
  void onInit(){
    super.onInit();
    getPermission();
    getAllSavedVideoFiles();
  }
  getPermission() async {
    var permission = await _storagePermission.request();
    permissionStatus.value=permission.name.toString();
    checkPermission();
  }

  checkPermission() async {
    var permission = await _storagePermission.status;
    currentStatus.value = permission.name.toString();
  }


  getAllSavedVideoFiles() async {
    EasyLoading.show();
    Directory appDir = await getApplicationDocumentsDirectory();
    String appFolderPath = appDir.path;
    List<FileSystemEntity> fileEntities = Directory(appFolderPath).listSync();
    videoFiles.clear();
    for (var entity in fileEntities) {
      if (entity is File && path.extension(entity.path) == '.mp4') {
        videoFiles.value.add(entity);
      }
    }

    EasyLoading.dismiss();
  }



  Future<String> getThumbnail(String path) async {
    final image = await VideoThumbnail.thumbnailFile(
      video: path,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      quality: 75,
    );
    return image ?? "";
  }

  void deleteVideoFile(String filePath) async {
    try {
      File file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        getAllSavedVideoFiles();
      }
    } catch (e) {
      print('Error deleting video file: $e');
    }
  }
  Future<String> getDuration(String path) async {
   var info =  await _flutterFFprobe.getMediaInformation(path);
      return("Duration: ${double.parse(info.getMediaProperties()!['duration']).toStringAsFixed(2)}");
  }
}

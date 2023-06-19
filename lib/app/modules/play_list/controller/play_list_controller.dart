import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class PlayListController extends GetxController {
  var videoFiles = List<File>.empty().obs;

  var selectedOption = ''.obs;



  Future<List> getAllSavedVideoFiles() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String appFolderPath = appDir.path;
    List<FileSystemEntity> fileEntities = Directory(appFolderPath).listSync();
    videoFiles.clear();
    for (var entity in fileEntities) {
      if (entity is File && path.extension(entity.path) == '.mp4') {
        videoFiles.value.add(entity);
      }
    }


    return videoFiles;
  }
  void deleteVideoFile(String filePath) async {
    try {
      File file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        getAllSavedVideoFiles();
      }
      else{
        print("nottttttttttttttttttttttttt");
      }
    } catch (e) {
      print('Error deleting video file: $e');
    }
  }
}

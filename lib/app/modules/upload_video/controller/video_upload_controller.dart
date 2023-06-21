import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class VideoUploadController extends GetxController {
  PlatformFile? pickedFile = PlatformFile(name: '', size: 0).obs();
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result == null) {
      return;
    } else {
      pickedFile = result.files.first;
      uploadFile(pickedFile!);
    }
  }

  Future uploadFile(PlatformFile pickedFile) async {
    final filePath = File(pickedFile.path.toString());

    try {
      Directory appDir = await getApplicationDocumentsDirectory();
      String appFolderPath = appDir.path;
      String newFilePath =
          path.join(appFolderPath, path.basename(filePath.path));
      if (File(newFilePath).existsSync()) {
        Get.snackbar("this video file is already uploaded ",
            "Please try again with another file",
            backgroundColor: Colors.red,
            barBlur: 50,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        await filePath.copy(newFilePath);
        Get.back();
      }
    } catch (e) {
      Get.snackbar("Unable to upload Video ", "",
          backgroundColor: Colors.red,
          barBlur: 50,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      print(e);
    }
  }

  Future<File?> getSavedVideoFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String appFolderPath = appDir.path;
    String videoFileName =
        'pexels-pressmaster-3209828-3840x2160-25fps.mp4'; // Replace with the actual file name of the saved video

    String videoFilePath = path.join(appFolderPath, videoFileName);
    File videoFile = File(videoFilePath);
    if (videoFile != null) {
      return videoFile;
    } else {
      return null;
    }
  }
}

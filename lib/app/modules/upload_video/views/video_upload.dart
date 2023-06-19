import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controller/video_upload_controller.dart';



class VideoUpload extends GetView<VideoUploadController> {
  const VideoUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          titleSpacing: 20,
          leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Get.back();
          }),
          leadingWidth: 50,
          backgroundColor: Colors.black54,
          elevation: 20,
          title: const Text(
            "Video player",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Please upload the File",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
            SizedBox(height: 30,),
            SizedBox(
              height: 100,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  ),
                  backgroundColor: Colors.black54
                ),
                onPressed: (){
                  controller.selectFile();

                },
                child:Icon(Icons.file_upload_outlined,weight: 20,size: 100,color: Colors.white,) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

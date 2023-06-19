import 'package:byte_converter/byte_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_app/app/modules/video_info/controller/video_info_controller.dart';


class VideoInfoPage extends GetView <VideoInfoController>{
  const VideoInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          titleSpacing: 20,
          leading: IconButton(icon: const Icon(Icons.arrow_back),
              onPressed: (){
                Get.back();
              }),
          leadingWidth: 50,
          backgroundColor: Colors.black54,
          elevation: 20,
          title: const Text(
            "Video info",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            RichText(text: TextSpan(
              children: [
                TextSpan(text: "Name :  ",style: TextStyle(
                  fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500
                )),
                TextSpan(text: controller.data.toString()
                    .split('/')
                    .last
                    .replaceAll("'", ''),style: TextStyle(
                    fontSize: 25,color: Colors.black,fontWeight: FontWeight.normal
                )),
              ]
            )),
            SizedBox(height: 30,),
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Size :  ",style: TextStyle(
                      fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500
                  )),
                  TextSpan(text: "${ByteConverter(controller.data.lengthSync().toDouble()).megaBytes.toStringAsFixed(2)} MB",style: TextStyle(
                      fontSize: 25,color: Colors.black,fontWeight: FontWeight.normal
                  )),
                ]
            )),
            SizedBox(height: 30,),
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Path :  ",style: TextStyle(
                      fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500
                  )),
                  TextSpan(text: controller.data.path.toString(),style: TextStyle(
                      fontSize: 25,color: Colors.black,fontWeight: FontWeight.normal
                  )),
                ]
            ))
          ],
        ),
      ),
    );
  }
}

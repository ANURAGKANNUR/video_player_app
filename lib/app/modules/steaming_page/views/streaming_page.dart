import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/streaming_controller.dart';

class StreamPage extends GetView<StreamController> {
  StreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            controller.chewieController!.pause();
            controller.chewieController!.dispose();

            Get.back();

          },
        ),
        titleSpacing: 20,
        backgroundColor: Colors.black54,
        elevation: 20,
        title: const Text(
          "Video player",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          controller.chewieController!.pause();
          controller.chewieController!.dispose();
          return true;
        },
        child: Chewie(
          controller: controller.chewieController!,
        ),
      ),
    );
  }
}

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

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
      body: Chewie(
        controller: controller.chewieController!,
      ),
    );
  }
}

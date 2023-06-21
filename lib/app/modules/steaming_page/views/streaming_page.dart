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
          onPressed: () {
            controller.chewieController!.pause();
            controller.chewieController!.dispose();
            controller.resetBrightness();

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
          controller.resetBrightness();
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: Chewie(
                controller: controller.chewieController!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Brightness",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Spacer(),
                  Obx(
                    () => Slider(
                        value: controller.brightnessValue.value,
                        label: "Brightness",
                        onChanged: controller.setBrightness),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Volume",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                  Obx(() => Slider(
                      value: controller.volumeValue.value,
                      label: "Volume",
                      onChanged: controller.setVolume)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

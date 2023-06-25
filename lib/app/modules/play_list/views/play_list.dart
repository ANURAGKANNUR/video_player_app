import 'dart:io';

import 'package:byte_converter/byte_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_app/app/modules/play_list/controller/play_list_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../../../routes/app_pages.dart';

class PlayList extends GetView<PlayListController> {
  PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          titleSpacing: 20,
          leading: Image.asset(
            'assets/video.png',
            color: Colors.white,
          ),
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Stack(
          children: [
            Obx(() {
              return (controller.videoFiles.value.isNotEmpty)
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.videoFiles.value.length,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(Routes.streamPage,
                              arguments: controller.videoFiles.value[index]),
                          child: Card(
                            elevation: 2,
                            child: ListTile(
                               contentPadding: const EdgeInsets.symmetric(
                                   vertical: 5, horizontal: 5),
                              // leading:
                              leading: FutureBuilder<String>(
                                future: controller.getThumbnail(
                                    controller.videoFiles.value[index].path),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.hasData) {
                                    final image = snapshot.data;
                                    return SizedBox(
                                        width: 100,
                                        child: Image(
                                            image: FileImage(File(image!))));
                                  }
                                  return const SizedBox();
                                },
                              ),
                              title: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                child: Text(
                                  controller.videoFiles.value[index]
                                      .toString()
                                      .split('/')
                                      .last
                                      .replaceAll("'", ''),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: [
                                    Text("${ByteConverter(controller.videoFiles.value[index].lengthSync().toDouble()).megaBytes.toStringAsFixed(2)} MB"),
                                    const Spacer(),
                                     FutureBuilder<String>(
                                       future: controller.getDuration(controller.videoFiles.value[index].path),
                                       builder: (BuildContext context,AsyncSnapshot<String> snapshot) {
                                         if (snapshot.hasData) {
                                           final duration = snapshot.data;
                                           return SizedBox(
                                               width: 100,
                                               child: Text(duration!));
                                         }
                                         return const SizedBox();
                                       }
                                     ),
                                    ElevatedButton(onPressed: (){
                                      Share.shareFiles([controller.videoFiles.value[index].path], text: 'Great picture');
                                    }, child: Text("share"))
                                  ],
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.more_vert_outlined),
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) => Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ListTile(
                                                    title: const Text('Info'),
                                                    onTap: () => Get.toNamed(
                                                        Routes.videoInfoPage,
                                                        arguments: controller
                                                            .videoFiles
                                                            .value[index]),
                                                  ),
                                                  ListTile(
                                                    title: const Text('Delete'),
                                                    onTap: () {
                                                      controller
                                                          .deleteVideoFile(
                                                              controller
                                                                  .videoFiles
                                                                  .value[index]
                                                                  .path
                                                                  .toString());
                                                      Get.back();
                                                    },
                                                  ),
                                                ],
                                              ));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("No videos found!!!!"),
                          Text("Please use + button to add the videos")
                        ],
                      ),
                    );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.videoUpload)!.then(
                            (value) => controller.getAllSavedVideoFiles()),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder()),
                        child: Image.asset(
                          'assets/plus.png',
                          color: Colors.black54,
                          height: 65,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

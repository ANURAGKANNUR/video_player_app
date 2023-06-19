import 'package:byte_converter/byte_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_app/app/modules/play_list/controller/play_list_controller.dart';
import 'package:video_player/video_player.dart';

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
        child: FutureBuilder(
            future: controller.getAllSavedVideoFiles(),
            builder: (context, AsyncSnapshot snapshot) {
              return Stack(
                children: [
                  Obx(() {
                    return (controller.videoFiles.value.isNotEmpty)
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.videoFiles.value.length,
                            itemExtent: 100,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Get.toNamed(Routes.streamPage,
                                    arguments:
                                        controller.videoFiles.value[index]),
                                child: Card(
                                  elevation: 2,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    leading:
                                        Image.asset('assets/thumbnail.jpeg'),
                                    title: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                              "${ByteConverter(controller.videoFiles.value[index].lengthSync().toDouble()).megaBytes.toStringAsFixed(2)} MB"),
                                          const Spacer(),
                                          const Expanded(
                                              child: Text("10.30.00")),
                                        ],
                                      ),
                                    ),
                                    trailing: Column(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                              Icons.more_vert_outlined),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) => Container(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ListTile(
                                                            title: Text('Info'),
                                                            onTap: () => Get.toNamed(
                                                                Routes
                                                                    .videoInfoPage,
                                                                arguments: controller
                                                                    .videoFiles
                                                                    .value[index]),
                                                          ),
                                                          ListTile(
                                                            title:
                                                                Text('Delete'),
                                                            onTap: () {
                                                              controller.deleteVideoFile(
                                                                  controller
                                                                      .videoFiles
                                                                      .value[
                                                                          index]
                                                                      .path
                                                                      .toString());
                                                              Get.back();
                                                            },
                                                          ),
                                                        ],
                                                      ),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.videoUpload)
                                  ?.then((value) =>
                                      controller.getAllSavedVideoFiles()),
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
              );
            }),
      ),
    );
  }
}

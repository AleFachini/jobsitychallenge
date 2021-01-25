import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobsitychallenge/app/data/argument_show.dart';

import 'package:jobsitychallenge/app/modules/home/controllers/home_controller.dart';
import 'package:jobsitychallenge/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TVMaze for Jobsity'),
        centerTitle: true,
      ),
      body: controller.obx(
          (data) => NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  var metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    if (metrics.pixels == 0) {
                      print('At top');
                      controller.loadPreviousPage();
                    } else {
                      print('At bottom');
                      controller.loadNextPage();
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: controller.scrollController, //Testing
                  padding: EdgeInsets.all(8),
                  itemCount: data.body.length,
                  itemBuilder: (BuildContext context, int index) {
                    //for testing only////////////
                    /*Timer(
                      Duration(seconds: 5),
                      () => controller.scrollController.jumpTo((controller
                              .scrollController.position.maxScrollExtent -
                          15)),
                    );*/
                    /////////////////////////////////
                    return Card(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              print(index);
                              homeController.setDetailsArgument(
                                  index, data.body[index]);
                              Get.toNamed(Routes.DETAILS);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Image.network(
                                  '${data.body[index]['image']['medium']}',
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              print(index);
                              homeController.setDetailsArgument(
                                  index, data.body[index]);
                              Get.toNamed(Routes.DETAILS);
                            },
                            title: Text(
                              '${data.body[index]['name']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            trailing: Obx(
                              () {
                                if (controller.isFavorite.value) {
                                  return IconButton(
                                    icon: Icon(Icons.star),
                                    onPressed: () {
                                      homeController.toFavorite();
                                    },
                                  );
                                } else {
                                  return IconButton(
                                    icon: Icon(Icons.star_border_outlined),
                                    onPressed: () {
                                      homeController.toFavorite();
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          onError: (error) => Center(
                child: Text(error),
              )),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jobsitychallenge/app/modules/episodes/controllers/episodes_controller.dart';
import 'package:jobsitychallenge/app/modules/episodes/views/episodesdetail_view.dart';
import 'package:jobsitychallenge/app/modules/home/controllers/seasons_controller.dart';

class EpisodesView extends GetView<EpisodesController> {
  SeasonsController localSeasonsController = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.getEpisodes(localSeasonsController.showID);
    return Scaffold(
      appBar: AppBar(
        title: Text('EpisodesView'),
        centerTitle: true,
      ),
      body: controller.obx(
        (data) => ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: data.body.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      controller.setEpisodeDetails(
                          data.body[index]['name'],
                          data.body[index]['season'],
                          data.body[index]['number'],
                          data.body[index]['image']['original'],
                          data.body[index]['summary']);
                      Get.to(EpisodesDetail());
                    },
                    title: Text(
                      '${data.body[index]['name']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    trailing: Icon(Icons.note_outlined),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

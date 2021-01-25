import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:jobsitychallenge/app/modules/episodes/controllers/episodes_controller.dart';

class EpisodesDetail extends GetView<EpisodesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Episode Details.'),
          centerTitle: true,
        ),
        body: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${controller.episodeDetails.value.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Episode Number: ${controller.episodeDetails.value.chapternumber}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Season Number: ${controller.episodeDetails.value.season}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Html(
                  data: '${controller.episodeDetails.value.summary}',
                  defaultTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(
                      '${controller.episodeDetails.value.imageUrl}',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

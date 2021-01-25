import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:jobsitychallenge/app/data/argument_show.dart';
import 'package:jobsitychallenge/app/modules/home/controllers/home_controller.dart';
import 'package:jobsitychallenge/app/modules/home/controllers/seasons_controller.dart';
import 'package:jobsitychallenge/app/routes/app_pages.dart';

class DetailsPage extends GetView<SeasonsController> {
  HomeController localHomeController = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.getSeasons(localHomeController.argShow.id);
    return Scaffold(
        appBar: AppBar(title: Text('Show Details')),
        body: Column(
          children: [
            Expanded(
              child: controller.obx(
                (data) => ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: data.body.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      print('${localHomeController.argShow.name}');
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Text(
                              '${localHomeController.argShow.name}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Image.network(
                              '${localHomeController.argShow.imageOriginal}',
                              width: 200,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Air on: ${localHomeController.argShow.scheduleDays}'),
                              Text(' at ${localHomeController.argShow.time}.'),
                            ],
                          ),
                          Text('Genres: ${localHomeController.argShow.genres}'),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Html(
                              data: '${localHomeController.argShow.summary}',
                              defaultTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      //rectifies the offset for the header
                      int idx = index - 1;
                      return ListTile(
                        onTap: () {
                          controller.setShowID(data.body[idx]['id']);
                          Get.toNamed(Routes.EPISODES);
                        },
                        title: Text(
                          'Season $index',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle:
                            Text('${data.body[idx]['episodeOrder']} Episodes.'),
                        trailing: Icon(Icons.arrow_forward),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ));
  }
}

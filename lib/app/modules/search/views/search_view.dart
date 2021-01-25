import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jobsitychallenge/app/modules/search/controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Shows'),
        centerTitle: true,
      ),
      body: controller.obx(
        (data) => ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: data.body.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    print(index);
                  },
                  title: Text(
                    '${data.body[index]['show']['name']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: null,
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}

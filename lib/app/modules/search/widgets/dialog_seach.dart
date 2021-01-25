import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobsitychallenge/app/modules/search/controllers/search_controller.dart';

class DialogSearch extends GetView<SearchController> {
  BuildContext dialogContext;
  @override
  Widget build(BuildContext context) {
    dialogContext = context;
    return Dialog(
      child: Container(
        child: TextField(
          onSubmitted: (String str) {
            print(str);
            controller.searchQuery = str;
            Navigator.pop(dialogContext);
            controller.search();
          },
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter a search term'),
        ),
      ),
    );
  }
}

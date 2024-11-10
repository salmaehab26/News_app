import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../API/api_manager.dart';
import '../../Model/Category.dart';
import '../Tabs/tab_widget.dart';

class CategoryDetails extends StatelessWidget {
   CategoryDetails({super.key,required this.category});
    Category category;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Apimanager.getSources(category.Id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ));
          }
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          }

          var sourcesList = snapshot.data!.sources!;
          if (sourcesList.isEmpty) {
            return Center(child: Text("No SOurces"));
          }
          return tab_widget(sourceslist: sourcesList);
        });;
  }
}

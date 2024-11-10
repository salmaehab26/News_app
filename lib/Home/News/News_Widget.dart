import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../API/api_manager.dart';
import 'news_item.dart';
import '../../Model/sources_response.dart';

class News_Widget extends StatelessWidget {
  News_Widget({super.key, required this.source});

  Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Apimanager.getNewsData(source.id ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Colors.deepOrange),
          );
        } else if (snapshot.hasError) return Text("something went wrong");
        if (snapshot.data!.status != "ok") {
          return Center(child: Text("error"));
        }

        var newslist = snapshot.data!.articles!;
        if (newslist.isEmpty)
          return Text("empty");
        return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(article: newslist[index]); // Customize as needed
            },
            itemCount: newslist.length);
      },
    );
  }
}

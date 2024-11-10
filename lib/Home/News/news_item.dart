import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Model/NewsResponse.dart';
import 'package:intl/intl.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.article});

  Articles article;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.parse(article.publishedAt??"");
    final DateFormat formatter = DateFormat('H');
    final String formatted = formatter.format(now);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage ?? "",
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator(color: Colors.green)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Text(article.author ?? "", style: TextStyle(color: Colors.grey)),
        Text(article.title ?? "",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        Text("$formatted Hours ago", textAlign: TextAlign.end,),
      ]),
    );
  }
}

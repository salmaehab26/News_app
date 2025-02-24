import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Home/cubit/news_status.dart';
import 'package:news/Home/cubit/news_view_model.dart';

import '../../API/api_manager.dart';
import 'news_item.dart';
import '../../Model/sources_response.dart';

class News_Widget_cubit extends StatefulWidget {
  News_Widget_cubit({super.key, required this.source});

  Source source;

  @override
  State<News_Widget_cubit> createState() => _News_Widget_cubitState();
}

class _News_Widget_cubitState extends State<News_Widget_cubit> {
  NewsViewmMdel newsViewmMdel = NewsViewmMdel();

  void initState() {
    super.initState();
    newsViewmMdel.getNewsData(widget.source.id??
    '');
  }

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<NewsViewmMdel, NewsStatus>(
        bloc: newsViewmMdel,
        builder: (context, state) {
          if (state is newsloadingstate) {
            return CircularProgressIndicator(
              color: Colors.cyan,
            );
          } else if (state is newserrorstate) {
            return Column(
              children: [
                Center(child: Text(state.errormessage)),
                ElevatedButton(
                    onPressed: () {
                      newsViewmMdel.getNewsData(widget.source.id!);
                    },
                    child: Text("try again"))
              ],
            );
          } else if (state is newssucssesstate) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(
                      article: state.newslist[index]); // Customize as needed
                },
                itemCount: state.newslist.length);
          }
          return Container();
        });
  }
}


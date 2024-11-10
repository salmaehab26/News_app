

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tab_item.dart';
import '../../Model/sources_response.dart';
import '../News/News_Widget.dart';

class tab_widget extends StatefulWidget {
  List<Source> sourceslist;
  tab_widget({super.key, required this.sourceslist});

  @override
  State<tab_widget> createState() => _tab_widgetState();
}

class _tab_widgetState extends State<tab_widget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    length: widget.sourceslist.length,
    child: Expanded(
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            isScrollable: true,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            tabs:widget.sourceslist
                .map((e) => Tab(
              child: SourceItem(
                source: e,
                isSelected:selectedIndex== widget.sourceslist.indexOf(e) ,
              ),
            ))
                .toList(),
          ),
          Expanded(child:
          News_Widget( source: widget.sourceslist[selectedIndex],)
      )
        ],
      ),
    ));
  }}
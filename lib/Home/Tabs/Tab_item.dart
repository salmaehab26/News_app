
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/sources_response.dart';

class SourceItem extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 6),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green,width: 2),
          color: isSelected ? Colors.green : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}

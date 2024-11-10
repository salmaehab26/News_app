import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
   HomeDrawer({super.key,required this.sideMinu});
   Function sideMinu;
   static int categories=1;
   static int settings=2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 310,
          height: 230,
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(90.0),
            child: Text("News App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
        ),
        InkWell(
          onTap: () {
          sideMinu(categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [Icon(Icons.list_rounded
              ,size: 35,
            ),Text("Categories",style: TextStyle(fontSize: 20),)],),
          ),
        ), InkWell(onTap: () {
sideMinu(settings);

        },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [Icon(Icons.settings
              ,size: 35,
            ),Text("Settings",style: TextStyle(fontSize: 20),)],),
          ),
        )
      ],
    );
  }
}

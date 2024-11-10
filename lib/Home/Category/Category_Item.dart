import 'package:flutter/cupertino.dart';
import 'package:news/Model/Category.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({required this.category, required this.index});

  Category category;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,width: 50,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
              bottomRight: Radius.circular(index % 2 != 0 ? 25 : 0))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(category.Image),
        Text(
          category.Title,
          style: TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}

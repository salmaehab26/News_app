import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/Category.dart';
import 'Category_Item.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key,required this.categotySelection});

  final categorylist = Category.getcategory();
  Function categotySelection;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(25),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(

                "Pick your category\nof interest",textAlign: TextAlign.left,
                style: TextStyle(

                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF4F5A69),)
                ,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return Padding(padding: EdgeInsets.only(left: index%2==0?10:0,right:index%2!=0?10:0 ),
                    child: InkWell(
                      onTap: () {
                        categotySelection(categorylist[index]);
                      },
                      child: CategoryItem(
                        category: categorylist[index],
                        index: index,
                      ),
                    ),
                  );
                },
                itemCount: categorylist.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

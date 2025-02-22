import 'package:flutter/material.dart';
import 'package:news/API/api_manager.dart';
import 'package:news/Drawer/HomeDrawer.dart';
import 'package:news/Home/Category/CategoryDetails.dart';

import 'Home/Category/CategoryDetails_cubit.dart';
import 'Home/Category/Category_Fragment.dart';
import 'Model/Category.dart';
import 'Settings/Settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white,
            child: Image.asset("assets/pattern.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover)),
        Scaffold(
            backgroundColor: Colors.transparent,
            drawer: Drawer(child: HomeDrawer(sideMinu: sideMinu,)),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.green,
              centerTitle: true,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              title: Text(selectedsideminu==HomeDrawer.settings?"Settings":
              selectedCategory==null?"News" :selectedCategory!.Id,

                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                selectedsideminu==HomeDrawer.settings?Settings():
                selectedCategory==null? CategoryFragment(categotySelection: categorySelection,):CategoryDetails(category: selectedCategory!,),

              ],
            ))
      ],
    );

  }
  Category? selectedCategory;
  void categorySelection(Category category){
selectedCategory=category;
setState(() {

});
  }
int selectedsideminu=HomeDrawer.categories;
  sideMinu(int selectionSideMinu){
    selectedsideminu=selectionSideMinu;
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }


}

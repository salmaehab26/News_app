
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Category{
  String Id;
  String Title;
  String Image;
  Color color;
  Category({required this.Image,required this.color,required this.Id,required this.Title});
  //  entertainment     technology
  static List <Category> getcategory(){
    return
    [
      Category(color:Color(0xffC91C22),Id:"sports" ,Image:"assets/ball.png" ,Title: "Sports" ),
      Category(color:Color(0xff003E90),Id:"general" ,Image:"assets/environment.png" ,Title: "General" ),
      Category(color:Color(0xffED1E79),Id:"health" ,Image:"assets/health.png" ,Title: "Health" ),
      Category(color:Color(0xffCF7E48),Id:"business" ,Image:"assets/bussines.png" ,Title: "Business" ),
      Category(color:Color(0xff4882CF),Id:"entertainment" ,Image:"assets/ball.png" ,Title: "Entertainment" ),
      Category(color:Color(0xffF2D352),Id:"science" ,Image:"assets/science.png" ,Title: "Science" ),
    ];
  }
}
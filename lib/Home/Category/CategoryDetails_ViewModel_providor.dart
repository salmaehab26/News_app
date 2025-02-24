// import 'package:flutter/cupertino.dart';
// import 'package:news/API/api_manager.dart';
//
// import '../../Model/sources_response.dart';
//
// class CategoryViewModel extends ChangeNotifier{
//   List<Source>? sourceList;
//   String? errorMessage;
//    void getsources(String categoryId )async{
//      //فايدة الnull اني افضي الاتنين لو حصل ايرور مثلا و بعمل ريلود هيكونوا اتملوا خلاص
//      // فلما اجي انده الفانكشن اول حاجه لازم افضيهم عشان تدخل تجيب الليسته و لو فيه ايرور ماسدج
//      sourceList=null;
//      errorMessage=null;
//      notifyListeners();
//      try {
//        var resposne = await Apimanager.getSources(categoryId);
//        if (resposne.status=="error"){
//          errorMessage =resposne.message;
//        }else
//          {sourceList=resposne.sources;}
//
//      } catch (e) {
//        errorMessage="error loading";
//      }
//      notifyListeners();
//    }
//
// }
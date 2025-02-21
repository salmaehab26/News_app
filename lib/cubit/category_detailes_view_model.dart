import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/sources_stats.dart';

import '../API/api_manager.dart';

class categorydetailsviewmodel extends Cubit<sourcestates> {
  categorydetailsviewmodel() :super(sourseloadingstate());

  void getsources(String categoryId) async {
    try {
      emit(sourseloadingstate());

      var resposne = await Apimanager.getSources(categoryId);
      if (resposne.status == "error") {
        emit(sourceerrorstate(errormessage: resposne!.message!));
      } else {

        emit(sourcesucssesstate(sourcesList: resposne!.sources!));
      }
    }

    catch (e) {
      emit(sourceerrorstate(errormessage: e.toString()));
    }
  }
}
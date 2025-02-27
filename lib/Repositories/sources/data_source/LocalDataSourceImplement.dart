import 'package:hive_flutter/adapters.dart';
import 'package:news/Model/sources_response.dart';

import 'package:hive_flutter/hive_flutter.dart';
import '../SourceDataSource.dart';

class LocalDataSourceImple implements SourceLocalDataSource {

  @override
  Future<SourceResponse?> getSources(String categoryId)  async {
    var box=await Hive.openBox("sources");
    var data =SourceResponse.fromJson(box.get('source'));
    return data;


  }
  @override
  void SaveSources(SourceResponse? sourceResponse) async {
   var box=await Hive.openBox("sources");
   await box.put('source',sourceResponse?.toJson());
   await box.close();
  }

}

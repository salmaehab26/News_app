import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:news/Model/sources_response.dart';

import '../SourceDataSource.dart';

class LocalDataSourceImple implements SourceLocalDataSource {

  @override
  Future<SourceResponse?> getSources(String categoryId)  async {
    var box=await Hive.openBox("tabs");
    var jsonData = box.get(categoryId);
    print("Retrieved data from Hive: $jsonData"); // Debugging line
    var data = SourceResponse.fromJson(json.decode(jsonData));
    print(" data from Hive: $jsonData"); // Debugging line
    return data;



  }
  @override
  void SaveSources(SourceResponse? sourceResponse, String category) async {
   var box=await Hive.openBox("tabs");
   await box.put(category, sourceResponse?.toJson());
   await box.close();
  }

}

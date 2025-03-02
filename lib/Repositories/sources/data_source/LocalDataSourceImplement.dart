import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:news/Model/sources_response.dart';

import '../SourceDataSource.dart';

class LocalDataSourceImple implements SourceLocalDataSource {

  @override

  Future<SourceResponse?> getSources(String categoryId) async {
    var box = await Hive.openBox("tabs");
    var jsonData = box.get(categoryId);

    if (jsonData == null) {
      print("No data found for category: $categoryId");
      return null;
    }

    print("Retrieved data from Hive: $jsonData"); // Debugging line

    try {
      if (jsonData is Map) {
        var data = jsonData.map((key, value) => MapEntry(key.toString(), value));
        return SourceResponse.fromJson(data);
      } else if (jsonData is String) {
        var decodedData = json.decode(jsonData) as Map<String, dynamic>;
        return SourceResponse.fromJson(decodedData);
      }
    } catch (e) {
      print("Error processing data from Hive: $e");
    }

    print("Unexpected data type in Hive: ${jsonData.runtimeType}");
    return null;
  }
  @override
  void SaveSources(SourceResponse? sourceResponse, String category) async {
    var box=await Hive.openBox("tabs");
    await box.put(category, json.encode(sourceResponse?.toJson()));
    await box.close();

  }

}

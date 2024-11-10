import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/NewsResponse.dart';
import '../Model/sources_response.dart';

class Apimanager {
// https://newsapi.org/v2/top-headlines/sources?apiKey=

  static Future<SourceResponse> getSources( String categoryId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "feee1a1c9bbd4138bfa18e6a2b82c77a","category":categoryId});
    http.Response resposne = await http.get(url);
    Map<String, dynamic> json = jsonDecode(resposne.body);

    return SourceResponse.fromJson(json);
  }

  // https://newsapi.org/v2/top-headlines?apiKey=feee1a1c9bbd4138bfa18e6a2b82c77a&sources=bbc-news
  static Future<SourceDetailsResponse> getNewsData(String sourceid) async {
    Uri url = Uri.https("newsapi.org", "v2/top-headlines",
        {"apiKey": "feee1a1c9bbd4138bfa18e6a2b82c77a", "sources": "$sourceid"});
    try {
      http.Response resposne = await http.get(url);
      Map<String, dynamic> json = jsonDecode(resposne.body);
      return SourceDetailsResponse.fromJson(json);

    } catch (e) {
      throw e;
    }
  }
}

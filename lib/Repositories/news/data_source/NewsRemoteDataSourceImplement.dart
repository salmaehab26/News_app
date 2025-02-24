import 'package:news/API/api_manager.dart';
import 'package:news/Model/NewsResponse.dart';

import '../Newsdatasource.dart';

class NewsRemoteDataSourceImple implements NewsRemoteDataSource{
  NewsRemoteDataSourceImple({required this.apimanager});
  Apimanager apimanager;
  @override
  Future<SourceDetailsResponse> getNewsData(String sourceid)async {
    var response=await apimanager.getNewsData(sourceid);
    return response;
  }

}
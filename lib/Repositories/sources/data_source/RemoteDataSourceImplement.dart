import 'package:news/Model/sources_response.dart';

import '../../../API/api_manager.dart';
import '../SourceDataSource.dart';

class RemoteDataSourceImple implements SourceRemoteDataSource{
   RemoteDataSourceImple({required this.Apimanger});
    Apimanager Apimanger ;
  @override
  Future<SourceResponse> getSources(String categoryId) async{
    var resposne = await Apimanger.getSources(categoryId);
    return resposne;

  }
}
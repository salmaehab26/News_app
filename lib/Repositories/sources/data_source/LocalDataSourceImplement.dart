import 'package:news/Model/sources_response.dart';

import '../../../API/api_manager.dart';
import '../SourceDataSource.dart';

class LocalDataSourceImple implements SourceLocalDataSource{
  LocalDataSourceImple({required this.Apimanger});

  Apimanager Apimanger ;
  @override
  void SaveSources(SourceResponse? sourceResponse) {
  }
    @override
    Future<SourceResponse?> getSources(String categoryId) async{
      var resposne = await Apimanger.getSources(categoryId);
      SaveSources(resposne);
      return resposne;
  }

}
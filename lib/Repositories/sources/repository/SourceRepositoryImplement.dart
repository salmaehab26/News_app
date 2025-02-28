import 'package:news/Model/sources_response.dart';
import 'package:news/Repositories/sources/SourceDataSource.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../source_repository.dart';

class SourceRepositoryImplement implements SourceRepository {
  SourceRemoteDataSource RemoteDataSource;
  SourceLocalDataSource LocalDataSource;

  SourceRepositoryImplement(
      {required this.RemoteDataSource, required this.LocalDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    if (connectivityResult.contains(ConnectivityResult.wifi)||
    connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await RemoteDataSource.getSources(categoryId);
      print("response $response");
      LocalDataSource.SaveSources(response, categoryId);
      return response;
    } else {
      var response = await LocalDataSource.getSources(categoryId);
      print("responsessss $response");

      return response;
    }
  }
}

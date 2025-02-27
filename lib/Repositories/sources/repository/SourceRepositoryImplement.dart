import 'package:news/Model/sources_response.dart';
import 'package:news/Repositories/sources/SourceDataSource.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news/Repositories/sources/data_source/LocalDataSourceImplement.dart';

import '../source_repository.dart';

class SourceRepositoryImplement implements SourceRepository {
  SourceRemoteDataSource RemoteDataSource;
  SourceLocalDataSource LocalDataSource;

  SourceRepositoryImplement(
      {required this.RemoteDataSource, required this.LocalDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var response = await RemoteDataSource.getSources(categoryId);
      LocalDataSource.SaveSources(response);
      return response;
    } else {
      var response = await LocalDataSource.getSources(categoryId);
      return response;
    }
  }
}

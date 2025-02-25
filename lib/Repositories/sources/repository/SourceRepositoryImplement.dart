import 'package:news/Model/sources_response.dart';
import 'package:news/Repositories/sources/SourceDataSource.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../source_repository.dart';

class SourceRepositoryImplement implements SourceRepository {
  SourceRemoteDataSource RemoteDataSource;
  SourceLocalDataSource sourceLocalDataSource;
  SourceRepositoryImplement({required this.RemoteDataSource,required this.sourceLocalDataSource});

  @override
  Future<SourceResponse> getSources(String categoryId)async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
      var response= RemoteDataSource.getSources(categoryId);
      sourceLocalDataSource.SaveSources(response);
      return response;
  }
}
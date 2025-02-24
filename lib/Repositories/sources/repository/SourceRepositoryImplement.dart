import 'package:news/Model/sources_response.dart';
import 'package:news/Repositories/sources/SourceDataSource.dart';

import '../source_repository.dart';

class SourceRepositoryImplement implements SourceRepository {
  SourceRemoteDataSource RemoteDataSource;
  SourceRepositoryImplement({required this.RemoteDataSource});

  @override
  Future<SourceResponse> getSources(String categoryId) {
    return RemoteDataSource.getSources(categoryId);
  }
}
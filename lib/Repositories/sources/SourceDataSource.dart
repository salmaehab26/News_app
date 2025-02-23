import '../../Model/sources_response.dart';

abstract class SourceRemoteDataSource{
  Future<SourceResponse>getSources(String categoryId);

}
abstract class SourceOfflineDataSource{}

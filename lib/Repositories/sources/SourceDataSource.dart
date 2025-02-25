import '../../Model/sources_response.dart';

abstract class SourceRemoteDataSource{
  Future<SourceResponse>getSources(String categoryId);

}
abstract class SourceLocalDataSource{
  Future<SourceResponse>getSources(String? categoryId);
  void SaveSources(SourceResponse? sourceResponse);
}

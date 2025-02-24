import '../../Model/NewsResponse.dart';

abstract class NewsRemoteDataSource{
  Future<SourceDetailsResponse>getNewsData(String sourceid);

}

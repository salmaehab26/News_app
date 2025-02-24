import '../../Model/NewsResponse.dart';

abstract class NewsRepository{
  Future<SourceDetailsResponse>getNewsData(String sourceid);
}
import 'package:news/Model/NewsResponse.dart';
import 'package:news/Repositories/news/Newsdatasource.dart';

import '../news_repository.dart';

class NewsRepositoryImple implements NewsRepository{
  NewsRepositoryImple({required this.newsRemoteDataSource});
    NewsRemoteDataSource newsRemoteDataSource;
  @override
  Future<SourceDetailsResponse> getNewsData(String sourceid) {
   return newsRemoteDataSource.getNewsData(sourceid);
  }
}


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../API/api_manager.dart';
import '../../Model/sources_response.dart';
import '../../Repositories/news/Newsdatasource.dart';
import '../../Repositories/news/data_source/NewsRemoteDataSourceImplement.dart';
import '../../Repositories/news/news_repository.dart';
import '../../Repositories/news/repository/NewsRepositoryImplement.dart';
import 'news_status.dart';

class NewsViewmMdel extends Cubit<NewsStatus> {
  late Apimanager apimanager;
  late NewsRepository newsRepository;
  late NewsRemoteDataSource newsRemoteDataSource;
  late Source source;
  NewsViewmMdel() :super(newsloadingstate()) {
      apimanager=Apimanager();
      source=Source();
      newsRemoteDataSource = NewsRemoteDataSourceImple(apimanager:apimanager );
      newsRepository = NewsRepositoryImple(newsRemoteDataSource: newsRemoteDataSource);
  }

  void getNewsData(String sourceid) async {
    try {
      emit(newsloadingstate());

      var resposne = await newsRepository.getNewsData(sourceid);
      if (resposne.status == "error") {
        emit(newserrorstate(errormessage: resposne!.message!));
      } else {
        emit(newssucssesstate(newslist: resposne!.articles!));
      }
    }

    catch (e) {
      emit(newserrorstate(errormessage: e.toString()));
    }
  }
}
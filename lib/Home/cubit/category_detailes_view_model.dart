import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/API/api_manager.dart';
import 'package:news/Home/cubit/sources_stats.dart';
import 'package:news/Repositories/sources/SourceDataSource.dart';
import 'package:news/Repositories/sources/data_source/LocalDataSourceImplement.dart';
import 'package:news/Repositories/sources/data_source/RemoteDataSourceImplement.dart';
import 'package:news/Repositories/sources/repository/SourceRepositoryImplement.dart';
import 'package:news/Repositories/sources/source_repository.dart';

class categorydetailsviewmodel extends Cubit<sourcestates> {
  late Apimanager apimanager;
  late SourceRepository sourceRepository;
  late SourceRemoteDataSource sourceRemoteDataSource;
  late SourceLocalDataSource sourceLocalDataSource;

  categorydetailsviewmodel() : super(sourseloadingstate()) {
    apimanager = Apimanager();
    sourceLocalDataSource=LocalDataSourceImple();
    sourceRemoteDataSource = RemoteDataSourceImple(Apimanger: apimanager);
    sourceRepository = SourceRepositoryImplement(
        RemoteDataSource: sourceRemoteDataSource,
        LocalDataSource: sourceLocalDataSource);
  }

  void getsources(String categoryId) async {
    try {
      emit(sourseloadingstate());

      var resposne = await sourceRepository.getSources(categoryId);
      if (resposne?.status == "error") {
        emit(sourceerrorstate(errormessage: resposne!.message!));
      } else {
        emit(sourcesucssesstate(sourcesList: resposne!.sources!));
      }
    } catch (e) {
      emit(sourceerrorstate(errormessage: e.toString()));
    }
  }
}

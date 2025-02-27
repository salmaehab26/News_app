import 'package:news/Model/sources_response.dart';

abstract class SourceRepository{
  Future<SourceResponse?>getSources(String categoryId);
}
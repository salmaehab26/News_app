import '../Model/sources_response.dart';

abstract class sourcestates{}
class sourceintistate extends sourcestates{}
class sourseloadingstate extends sourcestates{}
class sourceerrorstate extends sourcestates{
  String errormessage;
  sourceerrorstate({required this.errormessage});
}
class sourcesucssesstate extends sourcestates{
  List<Source>sourcesList;
  sourcesucssesstate({required this.sourcesList});
}
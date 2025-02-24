
import 'package:news/Model/NewsResponse.dart';

abstract class NewsStatus{}
class newsintistate extends NewsStatus{}
class newsloadingstate extends NewsStatus{}
class newserrorstate extends NewsStatus{
  String errormessage;
  newserrorstate({required this.errormessage});
}
class newssucssesstate extends NewsStatus{
  List<Articles>newslist;
  newssucssesstate({required this.newslist});
}
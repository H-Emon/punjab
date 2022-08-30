
import 'package:flutter/cupertino.dart';
import 'package:radio_punjab_today/Api%20Call/Get_News_Data/service.dart';
import '../Model/news_api_model.dart';


class NewsDataClass extends ChangeNotifier{
  NewsApi? post;
  bool loading=false;

  getNewsData()async{
    loading=true;
    post=(await getNewsDataApi())!;
    loading=false;
    notifyListeners();
  }

}
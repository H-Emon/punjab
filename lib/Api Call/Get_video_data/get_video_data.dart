


import 'package:flutter/cupertino.dart';
import 'package:radio_punjab_today/Api%20Call/Get_video_data/video_service_class.dart';

import '../Model/videos_api_model.dart';

class VideoDataClass extends ChangeNotifier{
 VideoApi? videos;
  bool loading=false;

  getVideoData()async{
    loading=true;
    videos=(await getVideoDataApi())!;
    loading=false;
    notifyListeners();
  }

}
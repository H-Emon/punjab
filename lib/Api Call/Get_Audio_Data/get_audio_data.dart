import 'package:flutter/cupertino.dart';
import '../Model/audios_api_model.dart';
import 'audio_service_class.dart';



class AudioDataClass extends ChangeNotifier{
  AudioApi? audios;
  bool loading=false;

  getAudioData()async{
    loading=true;
    audios =(await getAudioDataApi())!;
    loading=false;
    notifyListeners();
  }

}
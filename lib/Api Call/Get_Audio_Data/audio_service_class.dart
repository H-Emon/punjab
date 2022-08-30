import 'dart:convert';
import 'package:radio_punjab_today/Api%20Call/Model/audios_api_model.dart';
import 'package:http/http.dart' as http;

Future<AudioApi?> getAudioDataApi() async {
  AudioApi? result;

  try {
    final response =
    await http.get(Uri.parse("http://app2019.radiopunjabtoday.com/api/audio"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      return result = AudioApi.fromJson(data);
    } else {
      print("error");
    }
  } catch (e) {
    print(e.toString());
  }
  return result;
}
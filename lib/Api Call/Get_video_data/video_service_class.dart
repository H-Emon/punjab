import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/videos_api_model.dart';

Future<VideoApi?> getVideoDataApi() async {
 VideoApi? result;

  try {
    final response =
    await http.get(Uri.parse("http://app2019.radiopunjabtoday.com/api/video"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      return result = VideoApi.fromJson(data);
    } else {
      print("error");
    }
  } catch (e) {
    print(e.toString());
  }
  return result;
}
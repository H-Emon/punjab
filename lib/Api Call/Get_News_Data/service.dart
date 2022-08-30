import 'dart:convert';
import '../Model/news_api_model.dart';
import 'package:http/http.dart' as http;

Future<NewsApi?> getNewsDataApi() async {
  NewsApi? result;

  try {
    final response =
        await http.get(Uri.parse("https://radiopunjabtoday.com/?feed=json"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      return result = NewsApi.fromJson(data);
    } else {
      print("error");
    }
  } catch (e) {
    print(e.toString());
  }
  return result;
}

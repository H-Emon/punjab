import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NewsDetailScreen extends StatelessWidget {
   final String imgUrl,dateTime,titleText,bodyText ;
  const NewsDetailScreen({
    required this.titleText,
    required this.dateTime,
    required this.bodyText,
    required this.imgUrl,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          Image.network(imgUrl),
          SizedBox(
            height:30,
          ),
          Text(dateTime),
          SizedBox(
            height:30,
          ),
          Text(titleText),
          SizedBox(
            height:30,
          ),
          Text(bodyText),
        ],
      ),
    );
  }
}

//newsModel.post!.items![index].image!

//newsModel.post!.items![index].contentText!,
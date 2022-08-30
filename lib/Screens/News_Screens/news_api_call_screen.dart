import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Api Call/Get_News_Data/get_data.dart';
import 'news_detail_screen.dart';



class NewsDataScreen extends StatefulWidget {
  const NewsDataScreen({Key? key}) : super(key: key);

  @override
  State<NewsDataScreen> createState() => _NewsDataScreenState();
}

class _NewsDataScreenState extends State<NewsDataScreen> {
  @override
  void initState() {
    super.initState();
    final newsModel = Provider.of<NewsDataClass>(context, listen: false);
    newsModel.getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    final newsModel = Provider.of<NewsDataClass>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "News",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: newsModel.loading
          ? Container(
              color: Colors.grey,
            )
          : ListView.builder(
              itemCount: newsModel.post!.items!.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 400,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => NewsDetailScreen(
                                dateTime: newsModel
                                    .post!.items![index].datePublished!,
                                titleText:
                                newsModel.post!.items![index].title!,
                                imgUrl:
                                newsModel.post!.items![index].image!,
                                bodyText: newsModel
                                    .post!.items![index].contentText!,)));
                        },
                        child: Column(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 330,
                              color: Colors.purpleAccent,
                              child: Image.network(
                                newsModel.post!.items![index].image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "12:40 am ,26 Aug 2022",
                            style:
                                TextStyle(fontSize: 12, color: Colors.red[600]),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("")
                        ]),
                      ),
                    ));
              }),
      bottomSheet: Container(
        height: 100,
        color: Colors.white,
        child: Card(
          child: ListTile(
            tileColor: Colors.white,
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/radio _logo.jpg',
                  width: 50,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            title: Text(
              "Radio Punjab Today",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            trailing: Icon(
              Icons.pause,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:radio_punjab_today/Screens/Video_Play_Screens/video_play_details_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../Api Call/Get_video_data/get_video_data.dart';


class VideoShow extends StatefulWidget {
  const VideoShow({Key? key}) : super(key: key);

  @override
  State<VideoShow> createState() => _VideoShowState();
}

class _VideoShowState extends State<VideoShow> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoModel = Provider.of<VideoDataClass>(context, listen: false);
    videoModel.getVideoData();

  }

  @override
  Widget build(BuildContext context) {
    final videoModel = Provider.of<VideoDataClass>(context);
    return Scaffold(

        body: videoModel.loading
            ? Container(
          color: Colors.grey,
        )
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 110.h,
            width: double.infinity,

            child: ListView.builder(
                itemCount: videoModel.videos!.video!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                   onTap:(){
                     Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> VideoCategory(
                         youtubeUrl: videoModel.videos!.video![index].url.toString(),
                     titleTex:videoModel.videos!.video![index].title.toString() ,)));
                   },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: 100,
                              child: YoutubePlayer(
                                controller: YoutubePlayerController(
                                    initialVideoId: YoutubePlayer
                                        .convertUrlToId(
                                        videoModel.videos!.video![index].url
                                            .toString())!,
                                    flags: YoutubePlayerFlags(
                                        autoPlay: false,
                                        isLive: false,
                                        mute: true,
                                        hideControls: true,
                                        disableDragSeek: true

                                    )
                                ),
                                showVideoProgressIndicator: false,

                              ),
                            ),
                            Container(
                              height: 20,
                              width: 120,
                              child: Row(
                                children: [
                                  Text("New", style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w400
                                  ),),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    height: 12,
                                    width: 60,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        videoModel.videos!.video![index].title
                                            .toString(),
                                        style: TextStyle(


                                            fontSize: 10,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold
                                        ),),
                                    ),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ));
  }
}


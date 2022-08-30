import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Api Call/Get_Audio_Data/get_audio_data.dart';
import '../Api Call/Get_News_Data/get_data.dart';
import '../Api Call/Get_video_data/get_video_data.dart';
import '../Widgets/Drawer/navigation_container.dart';
import '../utils/colors.dart';
import 'Video_Play_Screens/video_play_details_screen.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AudioPlayer advancedPlayer=AudioPlayer();
  late YoutubePlayerController _controller;
  bool isPlaying=false;
  bool isMusicPlay=false;
  




  DateTime TextData(String link){
    final now=link;
    final time=DateTime.parse(now);
    return time;

  }







  Future<void> RadioOn(){
    isPlaying=true;
    return advancedPlayer.play("http://mehramedia.com:8051/;stream.mp3");

  }
  @override
  void initState() {
    super.initState();

    final videoModel = Provider.of<VideoDataClass>(context, listen: false);
    videoModel.getVideoData();
    RadioOn();
    final AudioModel = Provider.of<AudioDataClass>(context, listen: false);
    AudioModel.getAudioData();

    final newsModel = Provider.of<NewsDataClass>(context, listen: false);
    newsModel.getNewsData();



  }


  @override
  Widget build(BuildContext context) {
    final videoModel = Provider.of<VideoDataClass>(context);
    final AudioModel = Provider.of<AudioDataClass>(context);
    final newsModel = Provider.of<NewsDataClass>(context);

    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        backgroundColor: AppColors.appRedColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            //_scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Text(
          "Radio Punjab Today",
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 180.h,
            color: Colors.purpleAccent,
            child: Image.asset(
              'assets/images/radio _logo.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Card(
              child: ListTile(
                tileColor: Colors.white,
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      'assets/images/radio _logo.jpg',
                      width: 50.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                    )),
                title: Text(
                  "Radio Punjab Today",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.appRedColor),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "LIVE",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed:(){

                    if(isPlaying==false){
                        advancedPlayer.play("http://mehramedia.com:8051/;stream.mp3");
                        setState((){
                          isPlaying=true;
                        });}else if(isPlaying==true){
                      advancedPlayer.pause();
                      setState((){
                        isPlaying=false;
                      });
                    }




                  },
                 icon:Icon(isPlaying ? Icons.pause:Icons.play_arrow),
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Video",
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Call Studio",
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: AppColors.appRedColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.appRedColor,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.appRedColor,
                  ),
                ),
              ],
            ),
          ),
          videoModel.loading
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
        ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Audio",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.appRedColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          AudioModel.loading
              ? Container(
            color: Colors.grey,
          )
              : Container(
            padding:EdgeInsets.symmetric(horizontal: 10),
            height: 100.h,
            child: ListView.builder(
                itemCount: AudioModel.audios!.audio!.length ,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){

                    if(isMusicPlay==false) //true
                    {
                      advancedPlayer.play(AudioModel.audios!.audio![index].audioPath!);
                      setState((){
                        isMusicPlay=true; //false
                      });}else if(isMusicPlay==true){
                      advancedPlayer.pause();
                      setState((){
                        isMusicPlay=false;
                      });
                    }
                  },

                  child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Container(
                            height: 100.h,
                            width: 80.w,
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Stack(
                                children: [
                              Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Image.network(
                                     AudioModel.audios!.audio![index].imgPath!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: FittedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "New",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: AppColors.appRedColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              "25 AUG SH",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                          Align(
                              alignment: Alignment.center,
                              child:Icon(
                                isMusicPlay ? Icons.pause:Icons.play_arrow ,size:40,color:Colors.black,
                              )

                          )]),
                          ),
                        ),
                      ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "News",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.appRedColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          newsModel.loading
              ? Container(
            color: Colors.grey,
          )
              : Padding(

            padding: EdgeInsets.all(8.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Container(
                height: 230.h,
                width: double.maxFinite,
                child: Stack(children: [
                  Container(
                      height: 230.h,
                      width: double.maxFinite,
                      child: Image.network(
                        newsModel.post!.items![0].image!,
                        fit: BoxFit.cover,
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 80.h,
                        width: double.maxFinite,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.7)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                          newsModel.post!.items![0].title.toString(),
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(

                                DateFormat.yMMMMEEEEd().format(TextData(newsModel.post!.items![0].datePublished!),)  ,


                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "News",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.appRedColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          newsModel.loading
              ? Container(
            color: Colors.grey,
          )
              :   Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      height: 130.h,
                      width: double.maxFinite,
                      child: Stack(children: [
                        Container(
                            height: 130.h,
                            width: double.maxFinite,
                            child: Image.network(
                              newsModel.post!.items![1].image!,
                              fit: BoxFit.fill,
                            )),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 45.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                     height:20.h,
                                      child: SingleChildScrollView(
                                        child: Center(
                                          child: Text(
                              newsModel.post!.items![1].title.toString(),
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                            maxLines:2,
                                          ),
                                        ),
                                          scrollDirection:Axis.horizontal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,bottom:5),
                                    child:  Text(
                                      DateFormat.yMMMMEEEEd().format(TextData(newsModel.post!.items![1].datePublished!),)  ,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ]),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      height: 130.h,
                      width: double.maxFinite,
                      child: Stack(children: [
                        Container(
                            height: 130.h,
                            width: double.maxFinite,
                            child: Image.network(
                              newsModel.post!.items![2].image!,
                              fit: BoxFit.fill,
                            )),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 45.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7)),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height:20.h,
                                      child: SingleChildScrollView(
                                        child: Center(
                                          child: Text(
                                            newsModel.post!.items![2].title.toString(),
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                            maxLines:2,
                                          ),
                                        ),
                                        scrollDirection:Axis.horizontal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,bottom:5),
                                    child:  Text(
                                      DateFormat.yMMMMEEEEd().format(TextData(newsModel.post!.items![2].datePublished!),)  ,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Social",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.appRedColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/images.jfif",
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Website",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/Facebook-Icon-Large.png",
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "FaceBook",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/YouTube.png",
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "YouTube",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/email_logo.png",
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Email Us",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 110.h,
          )
        ],
      ),
      drawer: Drawer(
        width: 350.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 105.h,
              width: double.maxFinite,
              color: AppColors.appRedColor,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    "Radio Punjab Today",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                NavigationContainer(
                  titleText: "Home",
                  icon: Icons.home_filled,
                ),
                NavigationContainer(
                  titleText: "Call Studio",
                  icon: Icons.call_rounded,
                ),
                NavigationContainer(
                  titleText: "Download Audio",
                  icon: Icons.download,
                ),
                NavigationContainer(
                  titleText: "Our Team",
                  icon: Icons.supervised_user_circle_rounded,
                ),
                NavigationContainer(
                  titleText: "Privacy Policy",
                  icon: Icons.privacy_tip,
                ),
                NavigationContainer(
                  titleText: "Terms & Conditions",
                  icon: Icons.file_copy_outlined,
                ),
                NavigationContainer(
                  titleText: "Rate This App!",
                  icon: Icons.star_rate_outlined,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 43.h,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.red[600],
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Version",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Text(
                                "0.1",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 95.h,
        color: Colors.white,
        child: Card(
          child: ListTile(
            tileColor: Colors.white,
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  'assets/images/radio _logo.jpg',
                  width: 50.w,
                  height: 60.h,
                  fit: BoxFit.cover,
                )),
            title: Text(
              "Radio Punjab Today",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.grey,
              ),
            ),
            trailing:IconButton(
              onPressed:(){

                if(isPlaying==false){
                  advancedPlayer.play("http://mehramedia.com:8051/;stream.mp3");
                  setState((){
                    isPlaying=true;
                  });}else if(isPlaying==true){
                  advancedPlayer.pause();
                  setState((){
                    isPlaying=false;
                  });
                }




              },
              icon:Icon(isPlaying ? Icons.pause:Icons.play_arrow),
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

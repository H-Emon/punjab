import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Api Call/Get_Audio_Data/get_audio_data.dart';
import 'Api Call/Get_News_Data/get_data.dart';
import 'Api Call/Get_video_data/get_video_data.dart';
import 'Screens/Video_Play_Screens/vides_api_call_screen.dart';
import 'Screens/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      designSize:
      const Size(1284, 2778);
      minTextAdapt:
      true;
      splitScreenMode:
      true;
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NewsDataClass()),
          ChangeNotifierProvider(create: (context) => VideoDataClass()),
          ChangeNotifierProvider(create: (context) => AudioDataClass()),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.red[600],
                primarySwatch: Colors.red,
                scaffoldBackgroundColor: Colors.white54),
            home:HomePage()

            //VideoShow()

        ),
      );
    });
  }
}
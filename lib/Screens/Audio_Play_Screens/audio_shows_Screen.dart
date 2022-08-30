import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Api Call/Get_Audio_Data/get_audio_data.dart';
import 'audio_play_details.dart';






class AudioShowsScreen extends StatefulWidget {
  const AudioShowsScreen({Key? key}) : super(key: key);

  @override
  State<AudioShowsScreen> createState() => _AudioShowsScreenState();
}

class _AudioShowsScreenState extends State<AudioShowsScreen> {
  @override
  void initState() {
    super.initState();
    final AudioModel = Provider.of<AudioDataClass>(context, listen: false);
    AudioModel.getAudioData();
  }

  @override
  Widget build(BuildContext context) {
    final AudioModel = Provider.of<AudioDataClass>(context);
    return Scaffold(

      body: AudioModel.loading
          ? Container(
        color: Colors.grey,
      )
          : ListView.builder(
          itemCount: AudioModel.audios!.audio!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    var link= AudioModel.audios!.audio![index].audioPath;
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>(
                        HomeAudio(
                          audioLink: link!,
                        )
                    )));

                  },
                  child: Text("play"),
                ),
              ],
            );
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


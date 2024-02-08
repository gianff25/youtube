import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioCard extends StatefulWidget {
  const AudioCard({super.key});

  @override
  State<AudioCard> createState() => _AudioCardState();
}

class _AudioCardState extends State<AudioCard> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double sliderValue = 0.0;
  bool reproduciendo = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState(){
    super.initState();

    // play, pause
    audioPlayer.onPlayerStateChanged.listen((state){
      setState(() {
          isPlaying = state == PlayerState.playing;
      });
    });


    //duración del audio
    audioPlayer.onDurationChanged.listen((newDuration) { 
      setState(() {
        duration = newDuration;
      });
    });

    //posición del audio
    audioPlayer.onPositionChanged.listen((Duration newPosition) {
      setState(() {
        position = newPosition;
        sliderValue = position.inSeconds.toDouble();

        if(position >= duration){
          reproduciendo = false;
        }
      });
     });
  }

  Future setAudio() async {
    reproduciendo = true;
    audioPlayer.setReleaseMode(ReleaseMode.stop);

    audioPlayer.play(UrlSource(urlCancion));
  }

  @override
  void dispose(){

    audioPlayer.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(8),
      width: 300,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              ulrImagen,
              width: 230,
              height: 280,
              fit: BoxFit.cover,
            ),
          ),
          const Text('Titulo canción', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
      
          Text('Artista', style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.8))),
      
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
            onChangeEnd: (value) async {
                final newPosition = Duration(seconds: value.toInt());
                await audioPlayer.seek(newPosition);
            },
          ),
          
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(timeFormat(position), style: TextStyle(color: Colors.white.withOpacity(0.8))),
              Text(timeFormat(duration), style: TextStyle(color: Colors.white.withOpacity(0.8)))              
            ],
          ),
      
          CircleAvatar(
            radius: 35,
            child: IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 30,
              onPressed: () async {
                if(isPlaying){
                  await audioPlayer.pause();
                } 
                else {
                  if(reproduciendo){
                    await audioPlayer.resume();
                  }
                  else {
                    setAudio();
                  }
                }
              },
            ),
          )
      
      
        ],
      ),
    );
  }
}

String timeFormat(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

const ulrImagen = 'data:image/jpeg;base64,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';
const urlCancion = 'assets/locked_out_heaven.mp3';
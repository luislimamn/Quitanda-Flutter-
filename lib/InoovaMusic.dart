import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/audio_cache.dart';

class InoovaMusic extends StatefulWidget {
  const InoovaMusic({super.key});

  @override
  State<InoovaMusic> createState() => _InoovaMusicState();
}

class _InoovaMusicState extends State<InoovaMusic> {

  AudioPlayer audioPlayer = AudioPlayer();
  bool primeiraExecucao = true;
  double _volume = 0.5;

  _executarOnLine() async {
    audioPlayer.setVolume(_volume);
    if(primeiraExecucao){
      await audioPlayer.play(UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
      primeiraExecucao = false;
    }else{
      audioPlayer.resume();
    }

  }
  _executarOffLine() async {
    if(primeiraExecucao){
      await audioPlayer.play(AssetSource("assets/audios/tuTemUmaCara.mp3"));
      primeiraExecucao = false;
    }else{
      audioPlayer.resume();
    }

    //await audioPlayer.setSource(AssetSource('assets/audios/tuTemUmaCara.mp3'));
    //await audioPlayer.resume();
    //static AudioCache player = new AudioCache();
    //player.play('tuTemUmaCara.mp3');
    //AudioCache _audioCache = AudioCache(prefix: "assets/audios/tuTemUmaCara.mp3");
  }
  _pausar() async {
    await audioPlayer.pause();
  }
  _parar() async {
    await audioPlayer.stop();
    primeiraExecucao = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Executando Sons"),),
      body: Column(
        children: <Widget>[
          Slider(
            value: _volume,
            min: 0.0,
            max: 1.0,
            divisions: 10,
            onChanged: (novoVolume){
              setState(() {
                _volume = novoVolume;
              });
              audioPlayer.setVolume(_volume);
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: (){
                    _executarOnLine();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: (){
                    _pausar();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: (){
                    _parar();
                  },
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}


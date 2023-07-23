import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  late AssetsAudioPlayer player = AssetsAudioPlayer();
  final audios = <Audio>[
    Audio.network(
      'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3',
      metas: Metas(
        id: 'Online',
        title: 'Online',
        artist: 'Florent Champigny',
        album: 'OnlineAlbum',
        // image: MetasImage.network('https://www.google.com')
        image: const MetasImage.network(
            'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
      ),
    ),
    Audio.network(
      'https://prosearch.tribeofnoise.com/artists/show/24919/14195',
      metas: Metas(
        id: 'Online',
        title: 'Online',
        artist: 'Florent Champigny',
        album: 'OnlineAlbum',
        // image: MetasImage.network('https://www.google.com')
        image: const MetasImage.network(
            'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
      ),
    ),
  ];

  // this is for ApiPart

  /*  late String myRespons;
  late Map myMapresponse;

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(""));
    if (response.statusCode == 200) {
      setState(() {
        // myRespons = response.body;
        myMapresponse = jsonDecode(response.body);
      });
    }
  } */

  @override
  void initState() {
    // TODO: implement initState
    // apicall();
    super.initState();
    openPlayer();
  }

  void openPlayer() async {
    await player.open(
      Playlist(audios: audios, startIndex: 1),
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    player.dispose();
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("hi it is me"),
            Center(
              child: IconButton(
                onPressed: openPlayer,
                icon: const Icon(Icons.play_arrow),
              ),
            ),
          ],
        ),

        /*  Container(
          child: myMapresponse == null
              ? Text("Data is loading ... ")
              : Text(myMapresponse.toString()),
        ), */
      ),
    );
  }
}

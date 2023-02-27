import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'Settings_Page.dart';
import 'main.dart';

class DefaultPage extends StatefulWidget {
  late User user;

  DefaultPage({Key? key, required this.user}) : super(key: key);

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  List<Widget> _myWidgets = [];

  late User _current_user;
  late SQLiteService sqLiteService;
  // List of curent user's playlists
  List<Playlist> _usersPlaylists = <Playlist>[];

  // Every available song for each category
  List<Song> happy_songs = Song.Happy_songs;
  List<Song> sad_songs = Song.Sad_songs;
  List<Song> excited_songs = Song.Excited_songs;
  List<Song> angry_songs = Song.Angry_songs;

  // Audio player
  AudioPlayer _player = AudioPlayer();
  late Song _currently_playing = Song(title: '', artist: '', url: '', category: '');

  @override
  void initState() {
    super.initState();
    _current_user = widget.user;
    _myWidgets = _buildWidgets(4);
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final playlists = await sqLiteService.getUserPlaylists(_current_user);
      setState(() {
        _usersPlaylists = playlists;
      });
    });
  }

  // If you press a #feeling button, a random song of this category will start playing
  void feelingButton(List<Song> feelingList) async {
    final random = Random();
    // pick a random song from the song list
    final randomSong = feelingList[random.nextInt(feelingList.length)];
    _currently_playing = randomSong;
    _player.setAudioSource(
      AudioSource.uri(
        Uri.parse('asset:///${randomSong.url}'),
      ),
    );
    await _player.play();
    // Listen to the player state stream
    _player.playerStateStream.listen((playerState) async {
      if (playerState.processingState == ProcessingState.completed) {
        // Replay another random song from the list
        final newRandomSong = feelingList[random.nextInt(feelingList.length)];
        _currently_playing = newRandomSong;
        _player.setAudioSource(
          AudioSource.uri(
            Uri.parse('asset:///${newRandomSong.url}'),
          ),
        );
        await _player.play();
      }
    });
  }

  void Replay() async{
    await _player.stop();
    await _player.seek(Duration.zero);
    await _player.play();
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  // play/pause button
  void _press() {
    if (_player.playing) {
       _player.pause();
    } else {
       _player.play();
    }
    setState(() {});
  }

  // update _current_user when you come back from a page that changed user
  void _navigateToPage() async {
    final updatedUser = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage(user: widget.user)),
    );
    if (updatedUser != null) {
      setState(() {
        widget.user = updatedUser;
        _current_user = widget.user;
      });
    }
  }

  List<Widget> _buildWidgets(int count) {
    List<Widget> widgets = [];
    for (int i = 0; i < count; i++) {
      widgets.add(
        Container(
          height: 200,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(199, 57, 52, 62).withOpacity(0.55),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image(
                  image: AssetImage('assets/images/demopicture1.PNG'),
                  height: 145,
                  width: 140,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Center(
                  child: Text(
                    'My playlist $i',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xf7ffffff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 40,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: ElevatedButton(
                              onPressed: () {
                                _navigateToPage();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                                backgroundColor: const Color(0xff000000),
                              ),
                              child: const Icon(
                                Icons.settings,
                                color: Color(0xf7ffffff),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            child: SizedBox(
                              width: 300,
                              child: Expanded(
                                child: TextField(
                                  style: const TextStyle(
                                    //color: Color(0xfffb5a00),
                                    color: Color.fromARGB(240, 234, 232, 236),
                                    fontSize: 19,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          const Color.fromARGB(201, 84, 82, 79)
                                              .withOpacity(0.55),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 15.0),
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(170, 202, 196, 208),
                                      ),
                                      hintText: 'Search',
                                      suffixIcon: const Icon(
                                        Icons.search,
                                        color:
                                            Color.fromARGB(250, 202, 196, 208),
                                      )),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 40,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'I feel...',
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        height: 1.0526315789,
                        letterSpacing: 0.1000000015,
                        color: const Color(0xf7ffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 10),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            feelingButton(happy_songs);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffb5a00),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          child: SizedBox(
                            width: 100,
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Happy',
                                  style: GoogleFonts.inter(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900,
                                    height: 1.0526315789,
                                    letterSpacing: 0.1000000015,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () async {
                            feelingButton(sad_songs);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffb5a00),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          child: SizedBox(
                            width: 100,
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Sad',
                                  style: GoogleFonts.inter(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900,
                                    height: 1.0526315789,
                                    letterSpacing: 0.1000000015,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 10),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            feelingButton(excited_songs);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffb5a00),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          child: SizedBox(
                            width: 100,
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Excited',
                                  style: GoogleFonts.inter(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900,
                                    height: 1.0526315789,
                                    letterSpacing: 0.1000000015,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () async {
                            feelingButton(angry_songs);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffb5a00),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          child: SizedBox(
                            width: 100,
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Angry',
                                  style: GoogleFonts.inter(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900,
                                    height: 1.0526315789,
                                    letterSpacing: 0.1000000015,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 40,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'Suggestion for now...',
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        height: 1.0526315789,
                        letterSpacing: 0.1000000015,
                        color: const Color(0xf7ffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 400,
                    height: 250,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/heart-rate.png'),
                                    height: 40,
                                    width: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 255, 17, 0),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '97\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(
                                            text: 'bpm',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/stethoscope-clipart-xl.png'),
                                    height: 40,
                                    width: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '100/60\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(
                                            text: 'mmHG',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 255, 17, 0),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '36.7°C\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(
                                            text: '98°F',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/thermometer.png'),
                                    height: 40,
                                    width: 40,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 255, 17, 0),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'sp02\n',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 0, 255, 148),
                                            ),
                                          ),
                                          TextSpan(
                                            text: '98%',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 255, 234, 124),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/emojipng.com-12104423.png'),
                                    height: 40,
                                    width: 40,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(1.575),
                      child: const Image(
                        image: AssetImage(
                            'assets/images/smartwatch-clipart-design-illustration-free-png.webp'),
                        height: 263.57,
                        width: 180,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 52,
                    ),
                    child: Center(
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: const Color.fromARGB(199, 57, 52, 62)
                              .withOpacity(0.55),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: const Image(
                                image:
                                    AssetImage('assets/images/microphone.jfif'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            IconButton(
                              onPressed: _press,
                              // if  player is not playing a song then the icon is play
                              icon: !_player.playing
                                  ? const Icon(
                                      Icons.play_arrow,
                                      color: Color(0xfffb5a00),
                                      size: 100,
                                    )
                                  // otherwise it is pause
                                  : const Icon(
                                      Icons.pause,
                                      color: Color(0xfffb5a00),
                                      size: 100,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 40,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'My Playlists...',
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        height: 1.0526315789,
                        letterSpacing: 0.1000000015,
                        color: const Color(0xf7ffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: SizedBox(
                  height: 200,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const ScrollPhysics(),
                      child: Row(
                        children: <Widget>[
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: _myWidgets.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 15,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return _myWidgets[index];
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            bottom: 10,
            right: 10,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                    const Color.fromARGB(197, 139, 132, 148).withOpacity(0.75),
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xf7fc5b00),
                      ),
                      child: const Center(
                        child: Text(
                          'A',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(
                          _currently_playing.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          _currently_playing.artist,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Row(
                      children: [
                        IconButton(
                          icon: _player.playing
                              ? const Icon(
                                  Icons.pause,
                                  color: Color(0xfffb5a00),
                                  size: 36,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  color: Color(0xfffb5a00),
                                  size: 36,
                                ),
                          onPressed: _press,
                        ),
                        // IconButton(
                        //   icon: const Icon(
                        //     Icons.skip_previous,
                        //     color: Color(0xfffb5a00),
                        //     size: 36,
                        //   ),
                        //   onPressed: () {
                        //     // todo: Play song
                        //   },
                        // ),
                        IconButton(
                          icon: const Icon(
                            Icons.skip_next,
                            color: Color(0xfffb5a00),
                            size: 36,
                          ),
                          onPressed: () {
                            if(_currently_playing.category == 'Happy') {
                              feelingButton(happy_songs);
                            }
                            else if(_currently_playing.category == 'Sad') {
                              feelingButton(sad_songs);
                            }
                            else if(_currently_playing.category == 'Excited') {
                              feelingButton(excited_songs);
                            }
                            else {
                              feelingButton(angry_songs);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.replay,
                            color: Color(0xfffb5a00),
                            size: 36,
                          ),
                          onPressed: () {
                            Replay();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

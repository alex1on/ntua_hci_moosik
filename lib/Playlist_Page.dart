import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:ui';

import 'package:ntua_hci_moosik/main.dart';

import 'Default_Page.dart';

class PlaylistPage extends StatefulWidget {
  late User user;
  late Playlist playlist;
  late List<Song> playlistSongs;
  late AudioPlayer player;

  PlaylistPage(
      {Key? key,
      required this.user,
      required this.playlist,
      required this.player,
      required this.playlistSongs})
      : super(key: key);

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  List<Widget> _myWidgets = [];
  late User _current_user;
  late Playlist _current_playlist;
  late List<Song> _playlistSongs;
  late AudioPlayer _player;

  late SQLiteService sqLiteService;

  @override
  void initState() {
    super.initState();
    _current_user = widget.user;
    sqLiteService = SQLiteService();
    setState(() {
      _playlistSongs = widget.playlistSongs;
       _current_playlist = widget.playlist;
      _player = widget.player;
    _myWidgets = _buildWidgets(widget.playlistSongs.length);
    });
    // sqLiteService = SQLiteService();
    // sqLiteService.initDB().whenComplete(() async {
    //   final playlistSongs = await sqLiteService.getPlaylistSongs(widget.playlist);
    //   setState(() {
    //     _playlistSongs = playlistSongs;
    //     _myWidgets = _buildWidgets(_playlistSongs.length);
    //   });
    // });
  }

  // play/pause button
  void _press(int index) {
    if (_player.playing) {
       _player.pause();
       _player.setAudioSource(
      AudioSource.uri(
        Uri.parse('asset:///${widget.playlistSongs[index].url}'),
      ),
    );
    } else {
      _player.setAudioSource(
      AudioSource.uri(
        Uri.parse('asset:///${widget.playlistSongs[index].url}'),
      ),
    );
       _player.play();
    }
    setState(() {});
  }

  List<Widget> _buildWidgets(int count) {
    List<Widget> widgets = [];
    for (int i = 0; i < count; i++) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(201, 84, 82, 79).withOpacity(0.55),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xf7fc5b00),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.playlistSongs[i].title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.playlistSongs[i].artist,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
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
                    onPressed: () {
                      _press(i);
                    },
                  ),
                ),
              ],
            ),
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
      body: Column(
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
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DefaultPage(
                                        user: _current_user,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            backgroundColor: const Color(0xff000000),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
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
                                      borderRadius: BorderRadius.circular(100)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(170, 202, 196, 208),
                                  ),
                                  hintText: 'Search',
                                  suffixIcon: const Icon(
                                    Icons.search,
                                    color: Color.fromARGB(250, 202, 196, 208),
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: widget.playlist.title,
                        style: GoogleFonts.roboto(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          height: 1.0526315789,
                          letterSpacing: 0.1000000015,
                          color: const Color(0xf7ffffff),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                      ),
                      Stack(children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: const Image(
                            image: AssetImage('assets/images/demopicture1.PNG'),
                            width: 150,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ]),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                        ),
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: TextField(
                            maxLines: 5,
                            maxLength: 150,
                            style: TextStyle(
                              color: Color.fromARGB(250, 202, 196, 208),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter description here.',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 44, 41, 41),
                              ),
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
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _myWidgets.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _myWidgets[index];
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor:
            const Color.fromARGB(201, 84, 82, 79).withOpacity(0.55),
        elevation: 5,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntua_hci_moosik/main.dart';
import 'Build_Song_Row.dart';
import 'Default_Page.dart';

class SetUpPage extends StatefulWidget {
  late User user;
  late List<Playlist> defaultPlaylists;
  late int index;

  SetUpPage(
      {Key? key,
      required this.user,
      required this.defaultPlaylists,
      required this.index})
      : super(key: key);

  @override
  State<SetUpPage> createState() => _SetUpPageState();
}

class _SetUpPageState extends State<SetUpPage> {
  int _numSongs = 3;
  List<Song> happy_songs = Song.Happy_songs;

  late User _current_user;
  late List<Playlist> _defaultPlaylists;
  late int _current_index;
  late List<String> feelings = ['Happy', 'Sad', 'Excited', 'Angry'];

  late SQLiteService sqLiteService;
  // List of users in db
  List<User> _users = <User>[];
  // List of curent user's playlists
  List<Playlist> _usersPlaylists = <Playlist>[];

  @override
  void initState() {
    super.initState();
    _current_user = widget.user;
    _defaultPlaylists = widget.defaultPlaylists;
    _current_index = widget.index;
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final users = await sqLiteService.getUsers();
      final playlists = await sqLiteService.getUserPlaylists(_current_user);
      setState(() {
        _users = users;
        _usersPlaylists = playlists;
        _defaultPlaylists = widget.defaultPlaylists;
        _current_index = widget.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xff000000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Define your Style',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  height: 5.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'When you feel ${feelings[_current_index]},\nwhich of the following songs\nwould you prefer to listen to?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              for (int i = 0; i < _numSongs; i++)
                BuildSongRow(
                    color: Colors.grey[800],
                    song: happy_songs[i],
                    isNotSelected: true),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    // Load More
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _numSongs += 3;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfffb5a00),
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          'Load More',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    // Search button
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // todo: Search
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfffb5a00),
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          'Search',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                // Confirm button
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_current_index >= 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DefaultPage(user: _current_user)),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetUpPage(
                                user: _current_user,
                                defaultPlaylists: _defaultPlaylists,
                                index: ++_current_index)),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfffb5a00),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildSongRow(index) {
  //   return Column(
  //     children: [
  //       const SizedBox(height: 15),
  //       Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //           color: Colors.grey[800],
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(left: 8),
  //               child: IconButton(
  //                 icon: const Icon(
  //                   Icons.add,
  //                   color: Color(0xfffb5a00),
  //                   size: 36,
  //                 ),
  //                 onPressed: () {
  //                   // todo: add song
  //                 },
  //               ),
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   happy_songs[index].title,
  //                   style: const TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //                 Text(
  //                   happy_songs[index].artist,
  //                   style: const TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w500,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(right: 8),
  //               child: IconButton(
  //                 icon: const Icon(
  //                   Icons.play_arrow,
  //                   color: Color(0xfffb5a00),
  //                   size: 36,
  //                 ),
  //                 onPressed: () {
  //                   // todo: Play song
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(height: 15),
  //     ],
  //   );
  // }
}

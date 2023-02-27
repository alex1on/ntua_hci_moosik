import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntua_hci_moosik/Build_Song_Row.dart';

import 'main.dart';

class SearchPage extends StatefulWidget {
  late String? searchsong;
  late User user;

  SearchPage({Key? key, required this.user, this.searchsong}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _recentSongs = ['Song 1', 'Song 2', 'Song 3', 'Song 4'];
  final TextEditingController _searchController = TextEditingController();
  bool _showRelatedSongs = false;
  bool _showResultSong = false;

  late User _current_user;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _current_user = widget.user;
    if (widget.searchsong != null) {
      _searchController.text = widget.searchsong!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (String text) {
                      widget.searchsong = text;
                    },
                    controller: _searchController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Search for a song',
                      hintStyle: const TextStyle(
                        fontFamily: 'inter',
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.searchsong = widget.searchsong;
                            // searchsong can be used to.. search for the song
                            _showRelatedSongs = true;
                            _showResultSong = true;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _showRelatedSongs = false;
                      _showResultSong = false;
                    });
                  },
                ),
              ],
            ),
          ),
          if (_showRelatedSongs && _showResultSong)
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 16.0, bottom: 8.0),
                    child: Text(
                      'Result Song',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  BuildSongRow(
                    color: Colors.grey[800],
                    song: Song.Happy_songs[0],
                    isNotSelected: true,
                    user: _current_user,
                    category: 'Happy',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 16.0, bottom: 8.0),
                    child: Text(
                      'Related Songs',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        BuildSongRow(
                          color: Colors.grey[800],
                          song: Song.Happy_songs[0],
                          isNotSelected: true,
                          user: _current_user,
                          category: 'Happy',
                        ),
                        BuildSongRow(
                          color: Colors.grey[800],
                          song: Song.Happy_songs[0],
                          isNotSelected: true,
                          user: _current_user,
                          category: 'Happy',
                        ),
                        BuildSongRow(
                          color: Colors.grey[800],
                          song: Song.Happy_songs[0],
                          isNotSelected: true,
                          user: _current_user,
                          category: 'Happy',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 16.0, bottom: 8.0),
                    child: Text(
                      'Recent Songs',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      BuildSongRow(
                        color: Colors.grey[800],
                        song: Song.Happy_songs[0],
                        isNotSelected: true,
                        user: _current_user,
                        category: 'Happy',
                      ),
                      BuildSongRow(
                        color: Colors.grey[800],
                        song: Song.Happy_songs[0],
                        isNotSelected: true,
                        user: _current_user,
                        category: 'Happy',
                      ),
                      BuildSongRow(
                        color: Colors.grey[800],
                        song: Song.Happy_songs[0],
                        isNotSelected: true,
                        user: _current_user,
                        category: 'Happy',
                      ),
                    ],
                  )),
                ],
              ),
            ),
          if (!_showResultSong)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
              child: Text(
                'Recent Songs',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          if (!_showResultSong)
            Expanded(
              child: ListView.builder(
                itemCount: _recentSongs.length,
                itemBuilder: (context, index) {
                  return BuildSongRow(
                    color: Colors.grey[800],
                    song: Song.Happy_songs[0],
                    // songname: _recentSongs[index],
                    // artist: 'Artist',
                    isNotSelected: true,
                    user: _current_user,
                    category: 'Happy',
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

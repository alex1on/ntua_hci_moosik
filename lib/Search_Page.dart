import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntua_hci_moosik/Build_Song_Row.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _recentSongs = ['Song 1', 'Song 2', 'Song 3', 'Song 4'];
  final TextEditingController _searchController = TextEditingController();
  bool _showRelatedSongs = false;
  bool _showResultSong = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                      songname: 'Result Song',
                      isNotSelected: true),
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
                            songname: 'Related Song 1',
                            isNotSelected: true),
                        BuildSongRow(
                            color: Colors.grey[800],
                            songname: 'Related Song 2',
                            isNotSelected: true),
                        BuildSongRow(
                            color: Colors.grey[800],
                            songname: 'Related Song 3',
                            isNotSelected: true),
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
                          songname: 'Recent Song 1',
                          isNotSelected: true),
                      BuildSongRow(
                          color: Colors.grey[800],
                          songname: 'Recent Song 3',
                          isNotSelected: true),
                      BuildSongRow(
                          color: Colors.grey[800],
                          songname: 'Recent Song 2',
                          isNotSelected: true),
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
                      songname: _recentSongs[index],
                      isNotSelected: true);
                },
              ),
            ),
        ],
      ),
    );
  }
}

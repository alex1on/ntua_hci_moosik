import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          if (_showRelatedSongs && _showResultSong) (
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
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
            )
          ),
          if (_showRelatedSongs && _showResultSong)
            Expanded(
              child: ListView(
                children: [
                  _buildSongRow('Result Song', Colors.grey[900])
                ],
              ),
            ),
          if (_showRelatedSongs && _showResultSong) (
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
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
            )
          ),  
          if (_showRelatedSongs && _showRelatedSongs)
            Expanded(
              child: ListView(
                children: [
                  _buildSongRow('Related Song 1', Colors.grey[900]),
                  _buildSongRow('Related Song 2', Colors.grey[900]),
                  _buildSongRow('Related Song 3', Colors.grey[900]),
                ],
              ),
            ),
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
          Expanded(
            child: ListView.builder(
              itemCount: _recentSongs.length,
              itemBuilder: (context, index) {
                return _buildSongRow(_recentSongs[index], Colors.grey[800]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongRow(String songname, Color ?color) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color ?? Colors.grey[800],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xfffb5a00),
                    size: 36,
                  ),
                  onPressed: () {
                    // todo: add song
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    songname,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Artist',
                    style: TextStyle(
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
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Color(0xfffb5a00),
                    size: 36,
                  ),
                  onPressed: () {
                    // todo: Play song
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

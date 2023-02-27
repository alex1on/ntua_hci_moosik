import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ntua_hci_moosik/main.dart';

class BuildSongRow extends StatefulWidget {
  final Color? color;
  late Song song;
  late bool isNotSelected;
  late User user;

  BuildSongRow({
    Key? key,
    required this.color,
    required this.song,
    required this.isNotSelected,
    required this.user,
  }) : super(key: key);

  @override
  BuildSongRowState createState() => BuildSongRowState();
}

class BuildSongRowState extends State<BuildSongRow> {
  AudioPlayer _player = AudioPlayer();
  late Song _song = widget.song;
  late User _user;

  late SQLiteService sqLiteService;

  /// [_category] and [_playlistID] will be used to insert/delete songs to/from playlist
  late String _category;
  late int _playlistID;

  @override
  void initState() {
    super.initState();
    _song = widget.song;
    _user = widget.user;
    _category = widget.song.category;
    _player.setAudioSource(
      AudioSource.uri(
        Uri.parse('asset:///${_song.url}'),
      ),
    );
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final playlistID = await sqLiteService.getPlaylistID(_user.id, _category);
      setState(() {
        _playlistID = playlistID;
      });
    });
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  void _press() {
    if (_player.playing) {
       _player.pause();
    } else {
      _player.play();
    }
    setState(
      () {
        // Listen to the player state stream
        _player.playerStateStream.listen(
          (playerState) {
            if (playerState.processingState == ProcessingState.completed) {
              // Replay the song from the start
              _player.seek(Duration.zero);
              _player.play();
            }
          },
        );
      },
    );
  }

  void AddSong() async {
    await sqLiteService.addSong(Song(
        title: _song.title,
        artist: _song.artist,
        url: _song.url,
        category: _song.category,
        playlistID: _playlistID));
  }

  void RemoveSong() async {
    int SongID = await sqLiteService.getSongID(
        _song.title, _song.artist, _song.url, _song.category, _playlistID);
    await sqLiteService.deleteSong(SongID);
  }

  void _select() {
    setState(() {
      // If add button is not selected, then you select it now, so add the song into the db
      if (widget.isNotSelected) {
        AddSong();
      } else {
        // Otherwise, remove it from the db
        RemoveSong();
      }
      widget.isNotSelected = !widget.isNotSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.color ?? Colors.grey[800],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                  icon: widget.isNotSelected
                      ? const Icon(
                          Icons.add,
                          color: Color(0xfffb5a00),
                          size: 36,
                        )
                      : const Icon(
                          Icons.check,
                          color: Color(0xfffb5a00),
                          size: 36,
                        ),
                  onPressed: _select,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.song.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.song.artist,
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
                  onPressed: _press,
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

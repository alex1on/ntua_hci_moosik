import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ntua_hci_moosik/main.dart';

class BuildSongRow extends StatefulWidget {
  final Color? color;
  late Song song;
  late bool isNotSelected;

  BuildSongRow({
    Key? key,
    required this.color,
    required this.song,
    required this.isNotSelected,
  }) : super(key: key);

  @override
  BuildSongRowState createState() => BuildSongRowState();
}

class BuildSongRowState extends State<BuildSongRow> {
  AudioPlayer _player = AudioPlayer();
  late bool _isPlaying;
  late Song _song = widget.song;

  @override
  void initState() {
    super.initState();
    _song = widget.song;
    _player.setAudioSource(
      AudioSource.uri(
        Uri.parse('asset:///${_song.url}'),
      ),
    );
    _isPlaying = _player.playing;
    _song = widget.song;
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  void _press() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
    setState(() {
      _isPlaying = _player.playing;
      // Listen to the player state stream
      _player.playerStateStream.listen((playerState) {
        if (playerState.processingState == ProcessingState.completed) {
          // Replay the song from the start
          _player.seek(Duration.zero);
          _player.play();
        }
      });
    });
  }

  void _select() {
    setState(() {
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
                  onPressed: _press,
                  icon: _isPlaying
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

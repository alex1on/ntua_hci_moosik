import 'package:flutter/material.dart';

class BuildSongWear extends StatefulWidget {
  final Color? color;
  late String title;

  BuildSongWear({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  BuildSongRowState createState() => BuildSongRowState();
}

class BuildSongRowState extends State<BuildSongWear> {
  late bool _isPlaying = false;

  void _press() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: widget.color ?? Colors.grey[800],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Currently Playing:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Author",
                style: TextStyle(
                  fontSize: 7,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          IconButton(
            visualDensity: const VisualDensity(),
            onPressed: _press,
            icon: _isPlaying
                ? const Icon(
                    Icons.pause,
                    color: Colors.black,
                    size: 18,
                  )
                : const Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 18,
                  ),
          ),
        ],
      ),
    );
  }
}

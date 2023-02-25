import 'package:flutter/material.dart';

class BuildSongRow extends StatefulWidget {
  final Color? color;
  final String songname;
  bool isNotSelected;

  BuildSongRow(
      {Key? key,
      required this.color,
      required this.songname,
      required this.isNotSelected})
      : super(key: key);

  @override
  BuildSongRowState createState() => BuildSongRowState();
}

class BuildSongRowState extends State<BuildSongRow> {
  bool _isPressed = true;
  void _press() {
    setState(() {
      _isPressed = !_isPressed;
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
                    widget.songname,
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
                  icon: _isPressed
                      ? const Icon(
                          Icons.play_arrow,
                          color: Color(0xfffb5a00),
                          size: 36,
                        )
                      : const Icon(
                          Icons.pause,
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

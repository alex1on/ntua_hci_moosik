import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:ntua_hci_moosik/wearos/Wear_Watch_Active.dart';
import 'package:ntua_hci_moosik/wearos/Wear_Watch_Ambient.dart';

class MoosikWear extends StatefulWidget {
  const MoosikWear({Key? key}) : super(key: key);

  @override
  State<MoosikWear> createState() => _MoosikWearState();
}

class _MoosikWearState extends State<MoosikWear> {
  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (BuildContext context, WearMode mode, child) {
        return mode == WearMode.active
            ? const WearWatchActive()
            : const WearWatchAmbient();
      },
    );
  }
}

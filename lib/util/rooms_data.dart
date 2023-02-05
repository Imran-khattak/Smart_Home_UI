import 'package:flutter/material.dart';
import 'package:smarthome_ui/util/app_color.dart';
import 'package:smarthome_ui/util/models.dart';
import 'package:smarthome_ui/util/room_controls.dart';

class RoomCard extends StatelessWidget {
  final SmartHomeModel roomData;
  const RoomCard({super.key, required this.roomData});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoomsControls(
                      roomData: roomData,
                    )));
      },
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.5,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Appcolor.fgColor,
          borderRadius: BorderRadius.circular(size.width * 0.07),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(roomData.roomImage),
              colorFilter: ColorFilter.mode(
                  Appcolor.black.withOpacity(0.2), BlendMode.darken)),
        ),
        child: Text(
          roomData.roomName,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Appcolor.white),
        ),
      ),
    );
  }
}

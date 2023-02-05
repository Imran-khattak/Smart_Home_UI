import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome_ui/util/app_color.dart';
import 'package:smarthome_ui/util/devices_switch.dart';
import 'package:smarthome_ui/util/glass_morphism.dart';
import 'package:smarthome_ui/util/models.dart';

class RoomsControls extends StatefulWidget {
  final SmartHomeModel roomData;
  const RoomsControls({super.key, required this.roomData});

  @override
  State<RoomsControls> createState() => _RoomsControlsState();
}

class _RoomsControlsState extends State<RoomsControls> {
  @override
  Widget build(BuildContext context) {
    final SmartHomeModel roomData = this.widget.roomData;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(roomData.roomImage), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Appcolor.fgColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Appcolor.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Appcolor.fgColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.settings,
                      color: Appcolor.white,
                    ),
                  ),
                ],
              ),
            )),
            bottomCard(size, roomData)
          ],
        ),
      ),
    );
  }

  Widget bottomCard(Size size, SmartHomeModel roomData) {
    return GlassMorphism(
      child: Container(
        width: double.infinity,
        height: size.height * 0.6,
        // color: Appcolor.white.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    roomData.roomName,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.white),
                  ),
                  SizedBox(
                    height: 30,
                    child: CupertinoSwitch(
                        activeColor: Appcolor.white,
                        trackColor: Appcolor.black.withOpacity(.3),
                        thumbColor: Appcolor.fgColor,
                        value: roomData.roomStatus,
                        onChanged: (value) {
                          setState(() {
                            roomData.roomStatus = value;
                          });
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 60),
              child: Text.rich(TextSpan(
                  text: 'Your ',
                  style: const TextStyle(fontSize: 16, color: Appcolor.white),
                  children: [
                    TextSpan(text: roomData.roomName),
                    const TextSpan(text: ' is connected with '),
                    TextSpan(text: roomData.devices!.length.toString()),
                    const TextSpan(text: ' and '),
                    TextSpan(
                        text: '${roomData.userAccess} users',
                        style: const TextStyle(
                            decoration: TextDecoration.underline)),
                    const TextSpan(
                      text: ' have access for ',
                    ),
                    TextSpan(text: roomData.roomName),
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                roomData.roomTemperature,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.white),
              ),
            ),
            Divider(
              color: Appcolor.white.withOpacity(0.5),
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Devices',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Appcolor.white,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.22,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: roomData.devices!.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0 || roomData.devices!.length + 1 == index) {
                      return const SizedBox(
                        width: 10,
                      );
                    }
                    final data = roomData.devices![index - 1];
                    return DeviceSwitch(data: data);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

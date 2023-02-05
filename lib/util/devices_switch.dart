import 'package:flutter/material.dart';
import 'package:smarthome_ui/util/app_color.dart';
import 'package:smarthome_ui/util/models.dart';

class DeviceSwitch extends StatefulWidget {
  final DeviceInRoom data;
  const DeviceSwitch({super.key, required this.data});

  @override
  State<DeviceSwitch> createState() => _DeviceSwitchState();
}

class _DeviceSwitchState extends State<DeviceSwitch> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final DeviceInRoom data = this.widget.data;
    final Duration _duration = Duration(milliseconds: 300);
    return GestureDetector(
      onTap: () {
        setState(() {
          data.deviceStatus = !data.deviceStatus;
        });
      },
      child: Container(
        width: size.width * 0.22,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Appcolor.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              top: !data.deviceStatus ? 0 : -size.height * 0.22 / 2,
              duration: _duration,
              child: Column(
                children: [deviceStatus(data), deviceNames(size, data)],
              ),
            ),
            AnimatedPositioned(
              bottom: data.deviceStatus ? 0 : -size.height * 0.22 / 2,
              duration: _duration,
              child: Column(
                children: [deviceStatus(data), deviceNames(size, data)],
              ),
            ),
            AnimatedPositioned(
              top: data.deviceStatus ? 0 : (size.height * 0.22 / 2) + 10,
              duration: _duration,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Appcolor.white,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: Appcolor.black.withOpacity(.2),
                        blurRadius: 20,
                      )
                    ]),
                child: Icon(
                  data.deviceStatus ? data.iconOn : data.iconOff,
                  color: Appcolor.fgColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container deviceNames(Size size, DeviceInRoom data) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: size.width * 22 - 16,
      child: Text(
        data.deviceName,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Appcolor.white,
            overflow: TextOverflow.ellipsis,
            height: 1.2),
      ),
    );
  }

  Padding deviceStatus(DeviceInRoom data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        data.deviceStatus ? 'On' : 'Off',
        style:
            const TextStyle(fontWeight: FontWeight.w300, color: Appcolor.white),
      ),
    );
  }
}

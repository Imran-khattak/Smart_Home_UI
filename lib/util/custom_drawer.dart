import 'package:flutter/material.dart';
import 'package:smarthome_ui/util/app_color.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        )),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Appcolor.fg1Color,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Appcolor.white,
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.2,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(width: 4, color: Appcolor.white),
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'IMraN Khattak',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Appcolor.white),
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Appcolor.white,
                              side: const BorderSide(color: Appcolor.white),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          child: const Text(
                            'Edit profile',
                            style: TextStyle(fontSize: 13),
                          ))
                    ],
                  )
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Appcolor.white,
                height: 40,
              ),
              drawerTile(Icons.people_alt_outlined, 'Manage users', () {}),
              drawerTile(Icons.tv_outlined, 'Devices ', () {}),
              drawerTile(Icons.bed, 'Rooms ', () {}),
              drawerTile(Icons.music_note, 'Music ', () {}),
              drawerTile(Icons.settings, 'Settings ', () {}),
              drawerTile(Icons.help_outline, 'Help ', () {}),
              const Spacer(),
              drawerTile(Icons.power_settings_new_outlined, 'Logout ', () {}),
            ],
          ),
        ),
      ),
    );
  }

  ListTile drawerTile(IconData icon, String title, VoidCallback ontap) {
    return ListTile(
      onTap: ontap,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Appcolor.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Appcolor.white),
      ),
    );
  }
}

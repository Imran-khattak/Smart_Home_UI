import 'package:flutter/material.dart';
import 'package:smarthome_ui/util/app_color.dart';
import 'package:smarthome_ui/util/custom_drawer.dart';

import '../util/models.dart';
import '../util/rooms_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Icons.menu));
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '27\u00b0',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 90,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Appcolor.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 5,
                                color: Appcolor.black.withOpacity(.1),
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(35),
                              bottomLeft: Radius.circular(35),
                            )),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Appcolor.fgColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi IMraN',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Welcome to your smart home ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Appcolor.fgColor.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 70,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Appcolor.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 5,
                            color: Appcolor.black.withOpacity(.1),
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        )),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Appcolor.fgColor.withOpacity(.1),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/11.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Appcolor.fgColor.withOpacity(.1),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/4.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Appcolor.fgColor.withOpacity(.1),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/6.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Appcolor.fgColor.withOpacity(.1),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/7.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Appcolor.fgColor.withOpacity(.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: Appcolor.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'All rooms',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios))
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: smartHomeData.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0 || smartHomeData.length + 1 == index) {
                      return Container(
                        width: 15,
                        height: size.height * 0.5,
                        color: Colors.transparent,
                      );
                    }
                    final data = smartHomeData[index - 1];

                    return RoomCard(roomData: data);
                  })),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:test_app/userpage/userhome.dart';
import 'package:test_app/userpage/userlist.dart';
import 'package:test_app/userpage/usersetting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class ListPlace {
  final String name;
  final String type;
  final String detail;
  final double latt;
  final double lngg;

  const ListPlace(
      {required this.name,
      required this.type,
      required this.detail,
      required this.latt,
      required this.lngg});
}

List<ListPlace> listplace = [
  const ListPlace(
    name: 'Wat Phra Si Rattana Mahathat',
    type: 'Temple',
    detail:
        'Wat Phra Sri Rattana Mahathat colloquially referred to as Wat-Phra-Sri or Wat Yai, is a Buddhist temple (wat) in Phitsanulok Province, Thailand, where it is located on east bank of Nan River, near Naresuan Bridge and opposite Phitsanulok Provincial Hall. It is about 337 km (209 mi) from Bangkok.',
    latt: 16.82361,
    lngg: 100.26251,
  ),
];

int _currentIndex = 0;

List<Widget> navpage = const [
  UserHome(),
  UserList(),
  UserSetting(),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: navpage[_currentIndex],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ]),
          child: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.black.withOpacity(.8),
                    color: Colors.black.withOpacity(.5),
                    tabs: const [
                      GButton(
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: LineIcons.list,
                        text: 'List',
                      ),
                      GButton(
                        icon: LineIcons.assistiveListeningSystems,
                        text: 'Settings',
                      ),
                    ],
                    selectedIndex: _currentIndex,
                    onTabChange: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ))),
        ));
  }
}
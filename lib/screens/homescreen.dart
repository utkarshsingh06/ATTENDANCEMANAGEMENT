import 'package:employee_attendance_system/screens/attendancescreen.dart';
import 'package:employee_attendance_system/screens/calenderscreen.dart';
import 'package:employee_attendance_system/screens/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> navigation = [
    FontAwesomeIcons.solidCalendarDays,
    FontAwesomeIcons.check,
    FontAwesomeIcons.solidUser,
  ];
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [CalenderScreen(), AttendanceScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: Container(
          height: 70,
          margin: const EdgeInsets.only(left: 12, right: 12, bottom: 24),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 10, offset: Offset(2, 2))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < navigation.length; i++) ...{
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = i;
                      });
                    },
                    child: Center(
                      child: FaIcon(
                        navigation[i],
                        color: i == currentIndex
                            ? Colors.redAccent
                            : Colors.black54,
                        size: i == currentIndex ? 30 : 26,
                      ),
                    ),
                  ),
                )
              }
            ],
          )),
    );
  }
}

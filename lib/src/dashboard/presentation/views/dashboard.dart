import 'package:flutter/material.dart';
import 'package:fun_chat/core/constants/colors.dart';
import 'package:fun_chat/core/widgets/custom_icon_icons.dart';
import 'package:fun_chat/src/calls/presentation/views/calls.dart';
import 'package:fun_chat/src/contacts/presentation/views/contacts.dart';
import 'package:fun_chat/src/dashboard/presentation/views/home.dart';
import 'package:fun_chat/src/settings/presentation/views/settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Widget> _pages = [
    HomePage(),
    CallPage(),
    ContactsPage(),
    SettingsPage()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _pages[_currentIndex]),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: KColors.bgOnBoarding,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 100,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: BottomNavigationBar(
            elevation: 1,
            selectedIconTheme: const IconThemeData(size: 24),
            unselectedIconTheme: const IconThemeData(size: 24),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            currentIndex: _currentIndex,
            backgroundColor: Colors.red,
            selectedItemColor: KColors.primaryColor,
            unselectedItemColor: Colors.white,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(CustomIcon.message_outlined),
                activeIcon: Icon(
                  CustomIcon.message_filled,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(CustomIcon.call_outlined),
                activeIcon: Icon(
                  CustomIcon.call_filled,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(CustomIcon.contacts_outlined),
                activeIcon: Icon(
                  CustomIcon.contacts_filled,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(CustomIcon.cog_outline),
                activeIcon: Icon(
                  CustomIcon.cog,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

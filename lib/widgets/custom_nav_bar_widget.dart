import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: MediaQuery.of(context).size.width * 0.08,
      fixedColor: Color(0xff000000),
      unselectedItemColor: Color(0xff454545),
      currentIndex: currentIndex,
      backgroundColor: Color(0xFFCFD6FF),
      elevation: MediaQuery.of(context).size.width * 0.7,
      useLegacyColorScheme: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps_sharp),
          label: 'Service',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work_history),
          label: 'Ventures',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      onTap: onTap,
    );
  }
}

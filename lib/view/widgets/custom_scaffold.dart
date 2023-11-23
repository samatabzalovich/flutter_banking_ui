import 'package:flutter/material.dart';

class CustomScaffoldWithBottomBar extends StatelessWidget {
  const CustomScaffoldWithBottomBar(
      {super.key, required this.body, required this.isBottomNavVisible}); // and maybe other Scaffold properties
  final bool isBottomNavVisible;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff213048), Color(0xff432148)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: SafeArea(child: body)),
      bottomNavigationBar:!isBottomNavVisible ?null : BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: "My cards",
            icon: Icon(Icons.wallet),
          ),
          BottomNavigationBarItem(
            label: "Payments",
            icon: Icon(Icons.calendar_month),
          ),
          BottomNavigationBarItem(
            label: "Transfers",
            icon: Icon(Icons.folder_zip),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

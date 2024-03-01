import 'package:e_project_watch_hub/Constants/Admin_Panel/Orders_Admin_panel.dart';
import 'package:e_project_watch_hub/Constants/Admin_Panel/Products_Admin_Panel.dart';
import 'package:e_project_watch_hub/Constants/Admin_Panel/Users_Admin_Panel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  List adminmyScreens =[
    const Order(),
    const AdminProduct(),
    const Users(),
  ];

  int currentIndex = 0;

  void pageShifter(index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  currentIndex == 0 ? Text('Order',style: GoogleFonts.abhayaLibre(fontSize: 30)) : currentIndex == 1 ? Text ('Product',style: GoogleFonts.abhayaLibre(fontSize: 30)): Text('User',style: GoogleFonts.abhayaLibre(fontSize: 30)),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('images/Watch Hub.png'),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body:adminmyScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: pageShifter,
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey.shade600,
          unselectedFontSize: 15,
          items: const [
            BottomNavigationBarItem(
                label: 'Orders',
                icon: Icon(Icons.border_color_sharp)),

            BottomNavigationBarItem(
                label: 'Products',
                icon: Icon(Icons.production_quantity_limits_sharp)),

            BottomNavigationBarItem(
                label: 'Users',
                icon: Icon(Icons.supervised_user_circle_sharp)),

            BottomNavigationBarItem(
                label: 'Logout',
                icon: Icon(Icons.logout,))
          ]),



    );
  }
}

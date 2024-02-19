
import 'package:e_project_watch_hub/Hamza/Product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  List AdminmyScreens =[
    const Grid(),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  Text('Admin Panel',style: GoogleFonts.aBeeZee(fontSize: 30)),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('images/Logo.png'),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body:AdminmyScreens[0],
      bottomNavigationBar: BottomNavigationBar(
          // currentIndex: currentIndex,
          // onTap: pageShifter,
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

      
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add)),
    );
  }
}

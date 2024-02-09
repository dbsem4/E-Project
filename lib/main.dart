import 'package:flutter/material.dart';
import 'package:e_project_watch_hub/Hamza/Splash_Screen.dart.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Watch Hub"),
        actions: const[
          CircleAvatar(
            backgroundImage: AssetImage('images/46.jpeg'),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          // currentIndex: currentIndex,
          // onTap: pageShifter,
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey.shade600,

          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home)),

            BottomNavigationBarItem(
                label: 'About',
                icon: Icon(Icons.info)),

            BottomNavigationBarItem(
                label: 'Product',
                icon: Icon(Icons.production_quantity_limits_sharp)),

            BottomNavigationBarItem(
                label: 'Apis',
                icon: Icon(Icons.api_sharp)),

            BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person))
          ]),

      drawer: Drawer(
        width: 280,
        backgroundColor: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: 280,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                      image: const AssetImage('images/Digital iconic.png'))
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 120,left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/46.jpeg'),
                    ),
                    const SizedBox(width: 4,),

                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Muhammad Hamza",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                          Text("ha2290501@gmail.com",style: TextStyle(
                              color: Colors.white
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(Icons.home,color: Colors.white,),
              title: Text("Home",style: TextStyle(
                  color: Colors.white),),
            ),
            const SizedBox(
              height: 10,
            ),

            const ListTile(
              leading: Icon(Icons.settings,color: Colors.white,),
              title: Text("Settings",style: TextStyle(
                  color: Colors.white),),
            ),
            const SizedBox(
              height: 10,
            ),

            const ListTile(
              leading: Icon(Icons.privacy_tip,color: Colors.white,),
              title: Text("Privacy",style: TextStyle(
                  color: Colors.white),),
            ),
           const SizedBox(
              height: 10,
            ),

            const ListTile(
              leading: Icon(Icons.location_city,color: Colors.white,),
              title: Text("Location",style: TextStyle(
                  color: Colors.white),),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(Icons.person,color: Colors.white,),
              title: Text("Profile",style: TextStyle(
                  color: Colors.white),),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(Icons.info,color: Colors.white,),
              title: Text("About App",style: TextStyle(
                  color: Colors.white),),
            ),
           const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(Icons.logout,color: Colors.white,),
              title: Text("Logout",style: TextStyle(
                  color: Colors.white),),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),

            const Center(
              child: Text("Version 1.1.0",style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
              ),),
            )
          ],
        ),
      ),
    );
  }
}


import 'dart:async';

import 'package:e_project_watch_hub/signup/login.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(milliseconds: 1000), ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>const Login(),
    )),
    );
    super.initState();
  }
  int currentIndex=0;
  void pageShifter(index){
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/re.png',)),


          ),

        ),

      ),




    );
  }
}
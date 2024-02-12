import 'dart:async';

import 'package:e_project_watch_hub/signup/register.dart';
import 'package:flutter/material.dart';
import 'package:e_project_watch_hub/main.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(milliseconds: 1000), ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>const register(),
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
                image: AssetImage('images/Watch Hub.png',)),


          ),

        ),

      ),




    );
  }
}
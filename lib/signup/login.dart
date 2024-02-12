import 'package:e_project_watch_hub/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {


  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  void login()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail.text,
          password: userPassword.text);
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user Login ")));
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
      }
    }on FirebaseAuthException catch(ex){
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Positioned(
            top: 80,
            left: 110,

            child: Container(
              child: Column(
                children: [
                  Text("Welcome Back",style: TextStyle(fontSize: 32,color: Colors.indigo.shade900),),
                  SizedBox(height: 3,),
                  Text("Login To Your Account",style: TextStyle(color: Colors.indigo.shade900),)
                ],
              ),
            ),
          ),



          /// Login Work Start Here ///

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    controller: userEmail,
                  ),
                ),
                SizedBox(height: 10,),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    controller: userPassword,
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  child: ElevatedButton(onPressed: () {
                    login();
                  
                  }, style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade900,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),// Adjust padding for button size
                  ),child: Text("Login",style: TextStyle(color: Colors.white),)),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}

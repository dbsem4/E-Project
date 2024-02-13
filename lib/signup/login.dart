import 'package:e_project_watch_hub/main.dart';
import 'package:e_project_watch_hub/signup/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  void login()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail.text,
          password: userPassword.text);
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User Login ")));
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(),));
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
                  const SizedBox(height: 3,),
                  Text("Login To Your Account",style: TextStyle(color: Colors.indigo.shade900),)
                ],
              ),
            ),
          ),



          /// Login Work Start Here ///

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    controller: userEmail,
                  ),
                ),
                const SizedBox(height: 10,),
                Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      prefixIcon: const Icon(Icons.key),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                    controller: userPassword,
                  ),
                ),
                const SizedBox(height: 20,),
                Card(
                  child: ElevatedButton(onPressed: () {
                    login();
                  
                  }, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade900,
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),// Adjust padding for button size
                  ),child: const Text("Login",style: TextStyle(color: Colors.white),)),
                ),
                const SizedBox(height: 20,),
                Center(child: ElevatedButton(onPressed: (){
                  const Register();
                }, child: const Text("Register")))
              ],
            ),
          ),
        ],
      )
    );
  }
}

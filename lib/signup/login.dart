import 'package:e_project_watch_hub/main.dart';
import 'package:e_project_watch_hub/signup/register.dart';
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
  final formkey = GlobalKey<FormState>();

  void dispose(){
    userEmail.dispose();
    userPassword.dispose();
    super.dispose();
  }
  bool hidepass = true;

  void login()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail.text,
          password: userPassword.text);
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("user Login ")));
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(),));
      }
    }on FirebaseAuthException catch(ex){
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login faild")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        key: formkey,
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 80,

              child: Container(
                child: Column(
                  children: [
                    Text("Welcome Back",style: TextStyle(fontSize: 32,color: Colors.indigo.shade900),),
                    const  SizedBox(height: 3,),
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
                  const   SizedBox(height: 10,),
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
                      validator: (val){
                        if(val==null || val==" " || val.isEmpty){
                          return "E-mail Address is Required";
                        }
                        if (!val.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                      },
                      controller: userEmail,
                    ),
                  ),
                  const  SizedBox(height: 10,),
                  Card(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        prefixIcon: const Icon(Icons.key),
                        suffix: IconButton(onPressed: () {
                          setState(() {
                            hidepass =! hidepass;
                          });
                        }, icon: hidepass==true? const Icon(Icons.remove_red_eye): const Icon(Icons.panorama_fish_eye)),

                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      obscureText: hidepass==true?true:false,
                      controller: userPassword,
                    ),
                  ),
                  const  SizedBox(height: 20,),
                  Card(
                    child: ElevatedButton(onPressed: () {
                      login();
                      if(formkey.currentState!.validate()){
                        print(userEmail.text);
                        userEmail.clear();
                      }


                    }, style: ElevatedButton.styleFrom(
                      primary: Colors.indigo.shade900,
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),// Adjust padding for button size
                    ),child: const Text("Login",style: TextStyle(color: Colors.white),)),
                  ),
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const register(),));
                  }, icon: Text("Sign Up",style: TextStyle(color: Colors.indigo.shade900),))
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

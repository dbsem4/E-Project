import 'package:e_project_watch_hub/main.dart';
import 'package:e_project_watch_hub/register.dart';
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

  final formkey = GlobalKey<FormState>();

  bool hidepass = false;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body:  Form(
          key: formkey,
          child: Stack(

            children: [
              Column(
                children: [
                  Stack(
                    children: [
                       Container(
                        height: height * .25,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40)
                            )
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 80,
                        child: Container(
                          // height: 60,
                          // width: 60,
                          child: Icon(Icons.verified_user,color: Colors.white,size: 80,),
                          // color: Colors.teal,
                        ),
                      )
                    ],
                  ),


                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60)
                          )
                      ),
                      /// Login Work check Here  ///

                      child: Column(
                        children: [

                          /// COMMIT WORK ///
                          // Positioned(
                          //   top: 100,
                          //   left: 80,
                          //
                          //   child: Column(
                          //     children: [
                          //       Text("Welcome Back",style: TextStyle(fontSize: 32,color: Colors.indigo.shade900),),
                          //       const  SizedBox(height: 3,),
                          //       Text("Login To Your Account",style: TextStyle(color: Colors.indigo.shade900),)
                          //     ],
                          //   ),
                          // ),



                          /// Login Work Start Here ///

                         const SizedBox(height: 40,),

                          const Align(
                              alignment: Alignment.center,
                              child: Text("Login",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 28,
                              color: Colors.black),)),


                          Container(
                            margin: const EdgeInsets.only(top: 90),
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
                                      return null;
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

                                /// Forgot Password Work Here ///
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(onPressed: () async{
                                    try{
                                      await FirebaseAuth.instance.sendPasswordResetEmail(email: userEmail.text);
                                    } catch(ex){
                                      if(context.mounted){
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email Not Sent")));
                                      }
                                    }

                                  }, child: const Text("Forgot Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
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
                                    primary: Colors.black,
                                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),// Adjust padding for button size
                                  ),child: const Text("Login",style: TextStyle(color: Colors.white),)),
                                ),
                                IconButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Register(),));
                                }, icon: Text("Sign Up",style: TextStyle(color: Colors.black),))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
}}

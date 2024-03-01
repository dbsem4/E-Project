import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {

TextEditingController userEmail = TextEditingController();
final auth = FirebaseAuth.instance;

void forgot()async{
 try{
   await FirebaseAuth.instance.sendPasswordResetEmail(email: userEmail.text);
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email sent Please check your Email")));
 }on FirebaseAuthException catch(ex){
  print(ex);

 }

}

  //
  // bool hidepass = true;
  // final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Stack(
          children: [
            Positioned(
              top: 100,
              left: 70,

              child: Container(
                child: Column(
                  children: [
                    Text("Welcome Back",style: TextStyle(fontSize: 32,color: Colors.indigo.shade900),),
                    const SizedBox(height: 3,),
                    Text("Forgot  Your Password",style: TextStyle(color: Colors.indigo.shade900),)
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
                      // validator: (val) {
                      //   if(val==null || val==" " || val.isEmpty){
                      //     return "Email Address is Required";
                      //   }
                      //   if (!val.contains('@')) {
                      //     return 'Please enter a valid email address "@" ';
                      //   }
                      // },
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





                  const SizedBox(height: 20,),
                  Card(
                    child: ElevatedButton(onPressed: () {
                      forgot();
                      // if(formkey.currentState!.validate()){
                      //
                      // }

                    }, style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade900,
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),// Adjust padding for button size
                    ),child: const Text("Forgot",style: TextStyle(color: Colors.white),)),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}

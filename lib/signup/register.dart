import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'login.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController userName = TextEditingController();
  TextEditingController userAge = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();


  void addImageuser()async{

    String userID = const Uuid().v1();
    // user add with image id //
    UploadTask uploadTask = FirebaseStorage.instance.ref().child("userImage/").child(userID).putFile(userProfile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String userImage = await taskSnapshot.ref.getDownloadURL();

  //   user data with id //
    register(userID: userID, userImage: userImage);
  }
  void register({String? userID, String? userImage})async{

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail.text, password: userPassword.text);
      Map<String,dynamic> userAdd = {
        "userID": userID,
        "userName": userName.text,
        "userImage": userImage,
        "userAge": userAge.text,
        "userEmail": userEmail.text,
        "userPassword": userPassword.text,
      };
      if(context.mounted){
        await FirebaseFirestore.instance.collection("userData").doc(userID).set(userAdd);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User Register ")));
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
        userName.clear();
        userAge.clear();
        userEmail.clear();
        userPassword.clear();
      }
    }on FirebaseAuthException catch(ex){
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code.toString())));
      }
    }

  }

  File? userProfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.grey.shade100,
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 120,

              child: Container(
                child: Column(
                  children: [
                     Text("Register",style: TextStyle(fontSize: 32,color: Colors.indigo.shade900),),
                    // SizedBox(height: 3,),
                     Text("Create Your Account",style: TextStyle(color: Colors.indigo.shade900),)
                  ],
                ),
              ),
            ),



            /// Register Work Start Here ///

            Container(
              margin: const EdgeInsets.only(top: 160,left: 10,right: 10),
              height: 420,
              width: double.infinity,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: (){
                            showAdaptiveDialog(context: context, builder: (context) {
                              return AlertDialog(
                                title: const Text("Select Your Image Source?"),
                                actions: [
                                  TextButton(onPressed: ()async{
                                    XFile? selectImage = await ImagePicker().pickImage(source: ImageSource.camera);
                                    if(selectImage != null){
                                      File convertedFile = File(selectImage.path);
                                      setState(() {
                                        userProfile = convertedFile;
                                      });
                                    }
                                    else{
                                      if(context.mounted){
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image Not Selected")));
                                      }
                                    }
                                    if(context.mounted){
                                      Navigator.pop(context);
                                    }
                                  }, child: const Text("Select From Camera", style: TextStyle(color: Colors.red),)),
                                  TextButton(onPressed: ()async{
                                    XFile? selectImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                                    if(selectImage != null){
                                      File convertedFile = File(selectImage.path);
                                      setState(() {
                                        userProfile = convertedFile;
                                      });
                                    }
                                    else{
                                      if(context.mounted){
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image Not Selected")));
                                      }
                                    }
                                    if(context.mounted){
                                      Navigator.pop(context);
                                    }
                                  }, child: const Text("Select From Gallery")),
                                ],
                              );
                            },);
                          },
                          child: userProfile == null ?
                          const CircleAvatar(
                            backgroundImage: NetworkImage('https://cdn3d.iconscout.com/3d/premium/thumb/man-9251877-7590869.png?f=webp'),
                            backgroundColor: Colors.blue,
                          ): CircleAvatar(
                            backgroundImage: userProfile !=null ? FileImage(userProfile!) : null,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,),

                      Card(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Name",
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          controller: userName,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Card(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Age",
                            prefixIcon: const Icon(Icons.auto_graph_rounded),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          controller: userAge,
                        ),
                      ),
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
                                borderSide:  const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          controller: userPassword,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Card(
                        child:Column(
                          children: [
                            ElevatedButton(onPressed: () {
                              register();
                            }, style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo.shade900,
                              // primary: Colors.amber.shade200,
                              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),// Adjust padding for button size
                            ),child: const Text("Register",style: TextStyle(color: Colors.white),)),

                            const SizedBox(
                              height: 3,
                            ),
                            ElevatedButton(onPressed: () {
                              register();
                            }, style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo.shade900,
                              // primary: Colors.amber.shade200,
                              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),// Adjust padding for button size
                            ),child: const Text("Register",style: TextStyle(color: Colors.white),)),
                          ],
                        )
                      ),

                    ],
                  ),

            ),
          ],
        ),
      )
    );
  }
}

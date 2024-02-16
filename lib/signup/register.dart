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
        body: Stack(
        children: [
        Positioned(
        top: 80,
        left: 120,

        child: Column(
        children: [
        Text("Register",style: TextStyle(fontSize: 32,color: Colors.indigo.shade900),),
            // SizedBox(height: 3,),
            Text("Create Your Account",style: TextStyle(color: Colors.indigo.shade900),)
            ],
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
            GestureDetector(
            onTap: ()async{
            showAdaptiveDialog(context: context, builder: (context) {
            return AlertDialog(
            title: const Text("Select your Image source>"),
            actions: [
            TextButton(onPressed: ()async {
            XFile? selectImage = await ImagePicker().pickImage(source: ImageSource.camera);
            if(selectImage != null){
            File convertedFile = File(selectImage.path);
            setState(() {
            userProfile = convertedFile;
            });
            }
            else{
            if(context.mounted){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image not selected")));
            }
            }
            if(context.mounted){
            Navigator.pop(context);
            }
            }, child: const Text("Select from camera",style: TextStyle(color: Colors.red),)),

            TextButton(onPressed: ()async {
            XFile? selectImage = await ImagePicker().pickImage(source: ImageSource.gallery);
            if(selectImage != null){
            File convertedFile = File(selectImage.path);
            setState(() {
            userProfile = convertedFile;
            });
            }
            else{
              if(context.mounted){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image not selected")));
              }
            }
            if(context.mounted){
              Navigator.pop(context);


            }
            }, child: const Text("select from gallery")),
            ],
            );
            },);
            },
              child: userProfile == null?
              const CircleAvatar(
                    backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                    backgroundColor: Colors.amberAccent,
              ): CircleAvatar(
                    backgroundImage: userProfile !=null ? FileImage(userProfile!): null,
                    backgroundColor: Colors.amberAccent,
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
          register();
        }, style: ElevatedButton.styleFrom(
          primary: Colors.indigo.shade900,
          // primary: Colors.amber.shade200,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),// Adjust padding for button size
        ),child: const Text("Register",style: TextStyle(color: Colors.white),)),
              )
            ],
            ),

            ),
        ],
        )
    );
  }
}
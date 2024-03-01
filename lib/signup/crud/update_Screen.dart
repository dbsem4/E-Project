import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class update_Screen extends StatefulWidget {
  const update_Screen({super.key, required this.uID,required this.uName, required this.uAge});

  final String uID;
  final String uName;
  final String uAge;

  @override
  State<update_Screen> createState() => _update_ScreenState();
}


class _update_ScreenState extends State<update_Screen> {


  @override
  Widget build(BuildContext context) {

    TextEditingController userName = TextEditingController();
    TextEditingController userAge = TextEditingController();

    void userUpdate()async{
      await FirebaseFirestore.instance.collection("userData").doc(widget.uID).update(
          {
            "userName": userName.text,
            "userAge": userAge.text,
          });
      Navigator.pop(context);
    }




    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body:  Column(
          children: [
            Stack(

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
                            child: Icon(Icons.update,color: Colors.white,size: 80,),
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
                        /// Update Work check Here  ///

                        child: const Column(
                          children: [

                            /// Update Work Start Here ///

                             SizedBox(height: 20,),

                             Align(
                                alignment: Alignment.center,
                                child: Text("Update Details",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 28,
                                    color: Colors.black),)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),


            const SizedBox(height: 20,),

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
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
                controller: userName,
              ),
            ),

            const  SizedBox(height: 10,),
            Card(
              child: ElevatedButton(onPressed: () {
                userUpdate();
              }, style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),// Adjust padding for button size
              ),child: const Text("Update",style: TextStyle(color: Colors.white),)),
            ),
            SizedBox(height: 10,),


        /// /// /// /// BOTTOM SHEET /// /// /// ///

            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return  SizedBox(
                      width: double.infinity,
                      height: 600,
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
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
                                  child: Icon(Icons.delete_sweep_outlined,color: Colors.white,size: 80,),
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
                                /// Delete Work check Here  ///

                                child: const Column(
                                  children: [

                                    /// Delete Work Start Here ///

                                    SizedBox(height: 40,),

                                    Align(
                                        alignment: Alignment.center,
                                        child: Text("Delete Details ",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 28,
                                            color: Colors.black),)),
                                  ],
                                ),
                              ),
                            ),


                            SizedBox(height: 40,),

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
                            SizedBox(height: 10,),
                            Card(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your Age",
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                ),
                                controller: userName,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Card(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your Age",
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                ),
                                controller: userName,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Card(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Your Age",
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                ),
                                controller: userName,
                              ),
                            ),

                            SizedBox(height: 20,),
                            Card(
                              child: ElevatedButton(onPressed: () {
                                userUpdate();
                              }, style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),// Adjust padding for button size
                              ),child: const Text("Delete",style: TextStyle(color: Colors.white),)),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Show Bottom Sheet'),
            ),

          ],
        )
    );
  }
}

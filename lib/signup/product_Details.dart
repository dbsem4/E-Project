import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class product_Details extends StatefulWidget {
  const product_Details({super.key});

  @override
  State<product_Details> createState() => _product_DetailsState();
}

class _product_DetailsState extends State<product_Details> {

  Future getUser()async{
    SharedPreferences userCred = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 1,
                          blurRadius: 2
                      )
                    ]
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: SearchBar(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  trailing: [
                    Icon(Icons.search)
                  ],
                  hintText: "Search Products...",

                )),

            const SizedBox(height: 20,),

            Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text("Popular Watches",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),)),

            const SizedBox(height: 20,),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Products").snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  var datalength = snapshot.data!.docs.length;
                  return ListView.builder(
                    itemCount: datalength,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      String uID = snapshot.data!.docs[index]["p-Id"];
                      String productName = snapshot.data!.docs[index]["p-Name"];
                      String productCategory = snapshot.data!.docs[index]["p-Category"];
                      String productPrice = snapshot.data!.docs[index]["p-Price"];
                      String productDesc = snapshot.data!.docs[index]["p-Description"];
                      String uImage = snapshot.data!.docs[index]["p-Image"];
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 170,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      spreadRadius: 1,
                                      blurRadius: 5
                                  )
                                ]
                            ),
                          ),

                          Positioned(
                            top: 10,
                            bottom: 10,
                            left: 10,
                            child: Card(
                              child: Container(
                                height: 170,
                                width: 150,
                                decoration:  BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                      image: NetworkImage(uImage),
                                      fit: BoxFit.cover),

                                ),


                              ),
                            ),
                          ),


                          Positioned(
                            top: 30,
                            left: 170,
                            child: Container(
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(productName, style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),),
                                  SizedBox(height: 5,),
                                  Text(productPrice, style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),),
                                  SizedBox(height: 5,),
                                  Text(productCategory, style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),),
                                  SizedBox(height: 5,),
                                  Text(productDesc, style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),),

                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            top: 140,
                            left: 280,
                            child: Container(
                              child: Column(
                                children: [

                                  TextButton(onPressed: () {

                                  },
                                      child: const Text("Remove",
                                        style: TextStyle(fontSize: 15,
                                            color: Colors.red),))
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },

                  );
                }
                if(snapshot.hasError){
                  return Text("Error");
                }

                return Container();
              },),


          ],

        ),
      )
    );
  }
}

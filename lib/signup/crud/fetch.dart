import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class fetch extends StatefulWidget {
  const fetch({super.key});


  @override
  State<fetch> createState() => _fetchState();
}

class _fetchState extends State<fetch> {

  // String uEmail ='';
  Future getUser()async{
    SharedPreferences userCred = await SharedPreferences.getInstance();
    // return userCred.getString("uEmail");
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),



      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Products").snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var datalength = snapshot.data!.docs.length;
            return ListView.builder(
              itemCount: datalength,
              itemBuilder: (context, index) {
                String productName = snapshot.data!.docs[index]["p-Name"];
                String productCategory = snapshot.data!.docs[index]["p-Category"];
                String productPrice = snapshot.data!.docs[index]["p-Price"];
                String productDesc = snapshot.data!.docs[index]["p-Description"];
                String uImage = snapshot.data!.docs[index]["p-Image"];
                return Column(
                  children: [
                    Text(productName),
                    Text(productCategory),
                    Text(productPrice),
                    Text(productDesc),
                     CircleAvatar(
                      backgroundImage: NetworkImage(uImage),
                    ),
                  ],
                );
              },);
          }
          if(snapshot.hasError){
            return Text("Error");
          }

          return Container();
        },),

    );
  }
}

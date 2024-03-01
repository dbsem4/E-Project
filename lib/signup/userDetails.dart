import 'package:flutter/material.dart';


class userDetails extends StatefulWidget {
  const userDetails({super.key});

  @override
  State<userDetails> createState() => _userDetailsState();
}

class _userDetailsState extends State<userDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                height: 170,
                width: double.infinity,
                color: Colors.black87,
              ),

              Positioned(
                top: 10,
                bottom: 10,
                left: 10,
                child: Card(
                  child: Container(
                    height: 170,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(image: AssetImage('images/images.jpg'),fit: BoxFit.cover),

                    ),


                  ),
                ),
              ),


              Positioned(
                top: 30,
                left: 170,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rado C129",style: TextStyle(fontSize: 20,color: Colors.white),),
                      SizedBox(height: 5,),
                      Text("pr.340",style: TextStyle(fontSize: 20,color: Colors.white),),
                      SizedBox(height: 5,),
                      Text("Rado",style: TextStyle(fontSize: 20,color: Colors.white),),

                    ],
                  ),
                ),
              ),

              Positioned(
                top: 100,
                left: 280,
                child: Container(
                  child: Column(
                    children: [
                      TextButton(onPressed: () {

                      }, child: Text("Approved",style: TextStyle(color: Colors.green),)),

                      TextButton(onPressed: () {

                      }, child: Text("Rejected",style: TextStyle(color: Colors.red),))
                    ],
                  ),
                ),
              )
            ],
          );
        },

      ),
    );
  }
}

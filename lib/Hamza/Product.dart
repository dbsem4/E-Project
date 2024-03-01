import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  List myimg=[
    'https://5.imimg.com/data5/NH/KT/MY-45002099/mens-stylish-jacket-500x500.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtLCa4VIxn1aIMucilD1xRHVNRcxLBYImvAA&usqp=CAU',
    'https://static-01.daraz.pk/p/2113cdd9809b20541e31a82e765b430c.jpg',
    'https://m.media-amazon.com/images/I/61xzXRggIYL._AC_SX679_.jpg',
    'https://i5.walmartimages.com/seo/adviicd-Jackets-for-Men-P-Coat-for-Men-Mens-Autumn-And-Winter-Casual-Solid-Coat-Simple-Sports-Zipper-Coat-Pocket-Boondocks-Jacket_d20667de-889f-4f0d-a526-23ed932db89a.699ba12414bbdc7efc263b7addca6b73.jpeg',
    'https://5.imimg.com/data5/NH/KT/MY-45002099/mens-stylish-jacket-500x500.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtLCa4VIxn1aIMucilD1xRHVNRcxLBYImvAA&usqp=CAU',
    'https://static-01.daraz.pk/p/2113cdd9809b20541e31a82e765b430c.jpg',
    'https://m.media-amazon.com/images/I/61xzXRggIYL._AC_SX679_.jpg',
    'https://i5.walmartimages.com/seo/adviicd-Jackets-for-Men-P-Coat-for-Men-Mens-Autumn-And-Winter-Casual-Solid-Coat-Simple-Sports-Zipper-Coat-Pocket-Boondocks-Jacket_d20667de-889f-4f0d-a526-23ed932db89a.699ba12414bbdc7efc263b7addca6b73.jpeg',
    'https://images.pexels.com/photos/931162/pexels-photo-931162.jpeg?auto=compress&cs=tinysrgb&w=400',
  ];
  
  int currentIndex = 0;
  
  List brandName = ["Rolex", "Calvin Kalein", "Apple", "Casio"];

  List logoName = ['images/rolexlogo.png','images/cklogo.png','images/applelogo.png','images/casiologo.png'];

  List pictures = ['images/rolex.png', 'images/ck.png', 'images/apple.png','images/casio.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CarouselSlider(
                  items: List.generate(pictures.length, (index) {
                    return Container(
                      width: double.infinity,
                      height: 400,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(pictures[index]))
                      ),
                    );
                  }
                  ),
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(
                          milliseconds: 1500),
                      height: 180

                  )),


            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                itemCount: brandName.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      width: 140,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(logoName[index])),
                            ),
                          ),
                          Text(
                            brandName[index],
                            style: TextStyle(
                                fontSize: 14,
                                color: currentIndex == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),


              StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Products").snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  String productLength = snapshot.data!.docs.length;
                  return Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: GridView.count(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      childAspectRatio: 150/250,
                      crossAxisCount: 2,children: List.generate(myimg.length,(index) {


                        ///

                        return Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 280,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade400
                              ),

                            ),

                            Positioned(
                              top: 14,
                              left: 5,
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(myimg[index]))
                                ),

                              ),
                            ),
                            Positioned(
                              left: 10,
                              child: Container(
                                height: 60,
                                margin: const EdgeInsets.only(top: 165),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('hellow world'),
                                    Text("hdsij")
                                  ],
                                ),

                              ),
                            ),
                          ],
                        );
                      },),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Icon(Icons.error_outline);
                } else {
                  return CircularProgressIndicator();
                }
              })
        ]),

        ),

      ),



    );
  }
}
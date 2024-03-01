import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {

  int cartNumber = 1;
  @override
  Widget build(BuildContext context) {

    timeDilation = 2.0;

    return Scaffold(
      backgroundColor: Colors.black87,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: const Text("Description",style: TextStyle(color: Colors.black),overflow: TextOverflow.ellipsis,),
      //   centerTitle: true,
      // ),

      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),

            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    width: 460,
                    height: 170,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 3,
                            blurRadius: 3
                        )
                      ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                            image: AssetImage('images/images.jpg')
                        ),


                    ),
                  ),

                  const  SizedBox(height: 10,),


                  Container(
                    margin: const EdgeInsets.only(top: 15,left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                       margin: const EdgeInsets.only(right: 50),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Author Name:",style: TextStyle(color: Colors.grey.shade400,fontSize: 16, fontWeight: FontWeight.w400),),
                              SizedBox(width: 10,),
                              const Text("Rolex Day-Date Oyster",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Date Published:",style: TextStyle(color: Colors.grey.shade400,fontSize: 16, fontWeight: FontWeight.w400),),
                              SizedBox(width: 10,),
                              const Text("2024-02-21",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w400),),

                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rating:  ",style: TextStyle(color: Colors.grey.shade400,fontSize: 14, fontWeight: FontWeight.w400),),
                              RatingBar.builder(
                                initialRating: 5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Category:",style: TextStyle(color: Colors.grey.shade400,fontSize: 16, fontWeight: FontWeight.w400),),
                              SizedBox(width: 10,),
                              const Text("Rolex",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w400),),

                            ],
                          ),
                        ),







                      ],
                    ),
                  ),
                  const  SizedBox(height: 10,),
                  const Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 300,
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ),
                  const  SizedBox(height: 3,),
                  Container(
                    child: const Column(
                      children: [
                         Text("Description", style: TextStyle(color: Colors.white ,fontSize: 14,fontWeight: FontWeight.w600),),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 82,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 7,
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: const Text("adskjfhkjhasdfkhasdhflksdhalfkhklsdhflkasdadsadsasdadasdadasdadshdflkhslkajdhflkhaskldhfklhsdfkhskldhflksahdflkhsdfklhsakldfhklhsakdjhfkshdfkhkladsfkjdshfkjadshfkjhsdakjfhkjasdfhkjsadhfkjhasdfkjhadskljfhkjasdfhkjdsfh",style: TextStyle(color: Colors.white),overflow: TextOverflow.fade,),
                  ),

                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 2,
                  ),
                ),

                const SizedBox(
                  width: 6,
                ),

                const Text("Add to Shell", style: TextStyle(color: Colors.white ,fontSize: 16,fontWeight: FontWeight.w400),),

                const SizedBox(
                  width: 6,
                ),

                SizedBox(
                  width: 80,
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 2,
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                        ),
                        child: IconButton(onPressed: (){
                          setState(() {
                            if (cartNumber>1) {
                              cartNumber  = cartNumber - 1;
                            }
                          });
                        }, icon: const Icon(Icons.keyboard_arrow_left,color: Colors.white,)),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: cartNumber == 1 ? const Text("Add To Cart",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),) : Text("$cartNumber",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
                        ),
                        child: IconButton(onPressed: (){
                          setState(() {
                            cartNumber = cartNumber + 1;
                          });
                        }, icon: const Icon(Icons.keyboard_arrow_right,color: Colors.white,)),
                      )
                    ],
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black,width: 1.6),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Text("Buy Now",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

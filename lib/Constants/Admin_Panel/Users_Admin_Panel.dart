import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List color = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.red,
  ];

  List brandName = ["All", "Pending", "Approved", "Rejected"];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
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
                        width: 120,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: currentIndex == index ? color[index] : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Text(
                          brandName[index],
                          style: TextStyle(
                              fontSize: 14,
                              color: currentIndex == index
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

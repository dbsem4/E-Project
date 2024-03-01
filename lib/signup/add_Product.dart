import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  TextEditingController productName = TextEditingController();
  TextEditingController productCategory = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productDesc = TextEditingController();

  void addImageProduct() async {
    String userID = const Uuid().v1();
    // user add with image id //
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child("userImage/")
        .child(userID)
        .putFile(productAdd!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String productImage = await taskSnapshot.ref.getDownloadURL();

    //   user data with id //
    product(userID: userID, proImage: productImage);
  }

  void product({String? userID, String? proImage}) async {
    try {
      Map<String, dynamic> productAdd = {
        "p-Id": userID,
        "p-Name": productName.text,
        "p-Image": proImage,
        "p-Price": productPrice.text,
        "p-Description": productDesc.text,
        "p-Category": productCategory.text,
      };
      await FirebaseFirestore.instance
          .collection("Products")
          .doc(userID)
          .set(productAdd);
    } catch (ex) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text(" Product Add ")));
    }
  }

  File? productAdd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10)
                      ]),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Add Product",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      productAdd == null
                          ? Container(
                        width: double.infinity,
                        height: 150,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                XFile? selectedImage = await ImagePicker()
                                    .pickImage(
                                    source: ImageSource.gallery);
                                if (selectedImage != null) {
                                  File convertedFile =
                                  File(selectedImage.path);
                                  setState(() {
                                    productAdd = convertedFile;
                                  });
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Image Selected"),
                                    backgroundColor: Colors.green,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    behavior: SnackBarBehavior.floating,
                                  ));
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Image not Selected"),
                                      backgroundColor: Colors.red,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      behavior: SnackBarBehavior.floating,
                                    ));
                                  }
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                width: 100,
                                height: 40,
                                margin: const EdgeInsets.only(
                                    right: 14, bottom: 14),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      size: 14,
                                    ),
                                    Text(
                                      "Choose Photo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                          : Container(
                        width: double.infinity,
                        height: 150,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(productAdd!))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                XFile? selectedImage = await ImagePicker()
                                    .pickImage(
                                    source: ImageSource.gallery);
                                if (selectedImage != null) {
                                  File convertedFile =
                                  File(selectedImage.path);
                                  setState(() {
                                    productAdd = convertedFile;
                                  });
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Image Selected"),
                                    backgroundColor: Colors.green,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    behavior: SnackBarBehavior.floating,
                                  ));
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Image not Selected"),
                                      backgroundColor: Colors.red,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      behavior: SnackBarBehavior.floating,
                                    ));
                                  }
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 40,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.only(
                                    right: 14, bottom: 14),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      size: 14,
                                    ),
                                    Text(
                                      "Change Photo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.user4,
                                color: Colors.black,

                              ),

                              hintText: "Product Name",
                              hintStyle: TextStyle(fontSize: 12),
                              border: UnderlineInputBorder(

                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)))),
                          controller: productName,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.trade,
                                color: Colors.black,
                              ),
                              hintText: "Category",
                              hintStyle: TextStyle(fontSize: 12),
                              border: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)))),
                          controller: productCategory,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.house,
                                color: Colors.black,
                              ),
                              hintText: "Price",
                              hintStyle: TextStyle(fontSize: 12),
                              border: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)))),
                          controller: productPrice,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Iconsax.message,
                                color: Colors.black,
                              ),
                              hintText: "Description",
                              hintStyle: TextStyle(fontSize: 12),
                              border: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)))),
                          controller: productDesc,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(onPressed: () {
                        addImageProduct();
                      },
                        style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF00FF57))),
                        child: const Text("Add"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
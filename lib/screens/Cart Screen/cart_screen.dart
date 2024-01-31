import 'package:e_commerce_app/screens/Home%20Screen/bottom_navBar.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MyCartScreen extends StatefulWidget {
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final userID = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Your Cart'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => MyBottomNavbar());
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('productsData')
            .where('id', isEqualTo: userID)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.hasData) {
            List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

            if (documents.isEmpty) {
              // Cart is empty, display a message
              return Center(
                  child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 23),
              ));
            }
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    documents[index].data() as Map<String, dynamic>;

                String imageUrl = data['image'];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: AppColors().SearchTextFieldbkgrnClr,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Center(
                              child: Image.asset(
                                imageUrl,
                                width: Get.width * 0.3,
                                //height: Get.height * 0.15,
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['name'],
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          Text(
                            data['price'],
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          Text(data['rating']),
                          GestureDetector(
                            onTap: () async {
                              print(userID);
                              try {
                                await FirebaseFirestore.instance
                                    .collection("productsData")
                                    .doc(userID)
                                    .delete();

                                setState(() {});

                                Get.snackbar("Deleted", "Product is Deleted");
                              } catch (error) {
                                print("Error deleting product: $error");
                                Get.snackbar(
                                    "Error", "Failed to delete product");
                              }
                            },
                            child: Icon(
                              Icons.delete,
                              color: const Color.fromARGB(255, 68, 67, 67),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}

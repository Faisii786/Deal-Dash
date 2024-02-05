import 'package:e_commerce_app/res/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyCartScreen extends StatefulWidget {
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My Cart',
          style: TextStyle(fontFamily: 'Muli1', color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("cartData")
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
                'your cart is empty.',
                style: TextStyle(fontSize: 23, fontFamily: 'Muli6'),
              ));
            }
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors().SearchTextFieldbkgrnClr,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Image.asset(documents[index]['image']),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      title: Text(documents[index]['title']),
                      subtitle: Text(documents[index]['price']),
                      trailing: GestureDetector(
                        onTap: () async {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection("cartData")
                              .doc(snapshot.data!.docs[index]["cartId"]
                                  .toString())
                              .delete();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.delete,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
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

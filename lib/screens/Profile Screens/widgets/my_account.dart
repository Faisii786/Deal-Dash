import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/screens/Profile%20Screens/widgets/account_containers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  //AuthService _auth = AuthService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var userId = FirebaseAuth.instance.currentUser!.uid.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors().iosArrowBack,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Personal Information",
          style: TextStyle(fontSize: 18, fontFamily: 'Muli6'),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      //Data fetching using Stream Builder
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection("users")
            .where("uid", isEqualTo: userId)
            .snapshots(),
        builder: (context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext, index) {
                      Map<String, dynamic> UserData = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    NetworkImage(UserData['image']),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            account_containers(
                                icon: Icons.person_2_outlined,
                                name: UserData['FirstName']),
                            SizedBox(
                              height: 20,
                            ),
                            account_containers(
                                icon: Icons.person_2_outlined,
                                name: UserData['LastName']),
                            SizedBox(
                              height: 20,
                            ),
                            
                            account_containers(
                                icon: Icons.call_outlined,
                                name: UserData['phone']),
                            SizedBox(
                              height: 20,
                            ),
                            account_containers(
                                icon: Icons.location_city_outlined,
                                name: UserData['country']),
                            SizedBox(
                              height: 20,
                            ),
                            // account_containers(
                            //     icon: Icons.password_outlined,
                            //     name: UserData['password']),
                            account_containers(
                                icon: Icons.email_outlined,
                                name: UserData['email']),
                            SizedBox(
                              height: 20,
                            ),
                            account_containers(
                                icon: Icons.password_outlined,
                                name: '********'),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(child: Text('No data to Display'));
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          } catch (exc) {
            print('exception is: $exc');
            return Center(child: Text('An error occurred.'));
          }
        },
      ),
    );
  }
}

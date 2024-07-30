import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travels_app/auth/auth_services.dart';
import 'package:travels_app/pages/select_signup_signin.dart';
import 'dart:io';
import 'dart:async';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final curruntUser = FirebaseAuth.instance.currentUser!;
  final _auth = AuthService();

  final usersCollection = FirebaseFirestore.instance.collection('Users');

  //image picker function
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  String? imageUrl;
  bool isLoading = false;
  Future<void> _pickImageFromGallery() async {
    try {
      XFile? res = await _picker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        await UploadImageToFirebase(File(res.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Faild to pick Image: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }

    // if (returnImage == null) return;
    // setState(() {
    //   _selectedImage = File(returnImage!.path);
    // });
  }

  Future<void> UploadImageToFirebase(File image) async {
    setState(() {
      isLoading = true;
    });
    try {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().microsecondsSinceEpoch}.png");
      await reference.putFile(image).whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Upload Successfully"),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      });

      imageUrl = await reference.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Faild to upload Image: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> editName(String field) async {
    String newName = "";
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Edit Name"),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Enter new username",
              ),
              onChanged: (value) {
                newName = value;
              },
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(newName);
                  },
                  child: Text("Save")),
            ],
          );
        });
    //update the username in firestore
    if (newName.trim().length > 0) {
      await usersCollection.doc(curruntUser.email).update({field: newName});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 244, 168, 54),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 120.0),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                GestureDetector(
                  onTap: () => editName("username"),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://cdn.icon-icons.com/icons2/2483/PNG/512/edit_circle_icon_149940.png",
                        width: 50,
                        color: Color.fromARGB(255, 68, 42, 72),
                      )),
                ),
              ],
            ),
          ),
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(curruntUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userdata = snapshot.data!.data() as Map<String, dynamic>;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: imageUrl == null
                                    ? Image.network(
                                        "https://www.shutterstock.com/image-vector/user-profile-icon-vector-avatar-600nw-2220431045.jpg",
                                        width: 140,
                                      )
                                    : Image.network(
                                        imageUrl!,
                                        fit: BoxFit.cover,
                                        width: 140,
                                        height: 140,
                                      ),
                              ),
                              //now show the loading circle
                              if(isLoading)Positioned(child: CircularProgressIndicator(color: Color.fromARGB(255, 244, 168, 54),),right: 50,top: 60,),
                              Positioned(
                                  right: 10,
                                  top: 110,
                                  child: GestureDetector(
                                    child: Icon(Icons.add_a_photo_outlined,
                                        size: 30),
                                    onTap: _pickImageFromGallery,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            userdata["username"],
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                curruntUser.email.toString(),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                              )),
                        ],
                      ),
                    ),

                    //one settingItme
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 172, 172, 172)
                                    .withOpacity(0.3),
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 79, 77, 77),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(
                                Icons.dark_mode_rounded,
                                color: const Color.fromARGB(255, 244, 168, 54),
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              "Light Mood",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Second settingItme
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 172, 172, 172)
                                    .withOpacity(0.3),
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 79, 77, 77),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(
                                Icons.privacy_tip_rounded,
                                color: const Color.fromARGB(255, 244, 168, 54),
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              "Security & Privacy",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Third settingItme
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 172, 172, 172)
                                    .withOpacity(0.3),
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 79, 77, 77),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(
                                Icons.help,
                                color: const Color.fromARGB(255, 244, 168, 54),
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              "Help & Information Center",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Forth settingItme
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 172, 172, 172)
                                    .withOpacity(0.3),
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 79, 77, 77),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(
                                Icons.report_rounded,
                                color: const Color.fromARGB(255, 244, 168, 54),
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              "Report",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Fifveth settingItme
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _auth.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectSignUpAndSignIn()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 244, 168, 54),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 172, 172, 172)
                                      .withOpacity(0.3),
                                  blurRadius: 10,
                                  blurStyle: BlurStyle.outer),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 79, 77, 77),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Icon(
                                  Icons.logout,
                                  color:
                                      const Color.fromARGB(255, 244, 168, 54),
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text(
                                "Log Out",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error" + snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

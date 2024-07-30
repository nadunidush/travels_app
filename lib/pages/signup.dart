import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travels_app/auth/auth_services.dart';
import 'package:travels_app/pages/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _username = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
    _username.dispose();
    _confirmPassword.dispose();
  }

  //Go To HomePage
  goToHome(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Home()));

  //Create SignUp
  _signUp() async {
    showDialog(
      context: context, 
      builder: (context) => const Center(
        child:CircularProgressIndicator(),
      ),
    );
    if (_password.text != _confirmPassword.text) {
      Navigator.pop(context);
      displayMessage("Password does not match!");
      return;
    }
    try {
      //create user
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text);

      //after creating the user, create a document in cloud firebase called as Users
      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        "username": _email.text.split("@")[0],
      });

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
    // final user =
    //     await _auth.createUserEmailAndPassword(_email.text, _password.text);
    // if (user != null) {
    //   print("User created Sucessfully");
    //   goToHome(context);
    // }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 26.0, top: 26.0, right: 26.0, bottom: 33.0),
      child: Column(
        children: [
          Text(
            "New Account",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              height: 1.30,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: _email,
            decoration: InputDecoration(
              label: Text("Email: "),
              prefixIcon: Icon(
                Icons.email_outlined,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _password,
            decoration: InputDecoration(
              label: Text("Password: "),
              prefixIcon: Icon(
                Icons.key,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _confirmPassword,
            decoration: InputDecoration(
              label: Text("Confirm Password: "),
              prefixIcon: Icon(
                Icons.key,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(230, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.orange),
              ),
              onPressed: _signUp,
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ))
        ],
      ),
    );
  }
}

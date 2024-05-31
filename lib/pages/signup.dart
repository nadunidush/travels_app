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
  final _username = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
    _username.dispose();
  }

  //Go To HomePage
  goToHome(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Home()));

  //Create SignUp
  _signUp() async {
    final user =
        await _auth.createUserEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      print("User created Sucessfully");
      goToHome(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 26.0, top: 26.0, right: 26.0, bottom: 33.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "New \nAccount",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  height: 1.30,
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt_outlined),
                      style: ButtonStyle(iconSize: WidgetStatePropertyAll(30)),
                    ),
                  ),
                  Text(
                    "Upload Your Photo",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 102, 102, 102),
                    ),
                  ),
                ],
              )
            ],
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
            controller: _username,
            decoration: InputDecoration(
              label: Text("Username: "),
              prefixIcon: Icon(
                Icons.person,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _password,
            decoration: InputDecoration(
              label: Text("password: "),
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

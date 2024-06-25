import 'package:flutter/material.dart';
import 'package:travels_app/auth/auth_services.dart';
import 'package:travels_app/pages/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  // Method to handle login errors
  void _handleLoginError(String error) {
    setState(() {
      if (error.contains(_email.text)) {
        _emailError = "Invalid email address";
      } else if (error.contains(_password.text)) {
        _passwordError = "Incorrect password";
      } else {
        _emailError = "Invalid email or password";
        _passwordError = "Invalid email or password";
      }
    });
  }

  //Login to The app
  _login() async {
    
    setState(() {
      _emailError = null;
      _passwordError = null;
    });
    
    try{
      final user =
        await _auth.loginUserEmailAndPassword(_email.text, _password.text);
      if (user != null) {
        print("Login to the app sucessfuly");
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      } else {
          _handleLoginError("Invalid email or password");
      }
    } catch (e) {
      _handleLoginError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 26.0, top: 26.0, right: 26.0, bottom: 100.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Welcome Back \nNadun",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/profile2.webp",
                      width: 70,
                    )),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                label: Text("Email"),
                prefixIcon: Icon(Icons.person),
                errorText: _emailError,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                label: Text("Passsword"),
                prefixIcon: Icon(Icons.key_outlined),
                errorText: _passwordError,
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(230, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                onPressed: _login,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

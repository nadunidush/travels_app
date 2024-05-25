import 'package:flutter/material.dart';
import 'package:travels_app/pages/signin.dart';
import 'package:travels_app/pages/signup.dart';

class SelectSignUpAndSignIn extends StatelessWidget {
  const SelectSignUpAndSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/signup_and_signin_page_photo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Scaffold with AppBar and body content
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white, size: 30),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text("Enjoy The Travel \nWith Us",
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 180,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(230, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: SignUp(),
                          ),
                        ),
                      );
                    },
                    child: Text("Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(230, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context, 
                          builder: (context) => SignIn()
                      );
                    },
                    child: Text("Sign In",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

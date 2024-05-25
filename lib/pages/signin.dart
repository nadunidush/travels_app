import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Welcome Back \nNadun"),
            Image.asset("assets/logo.jpeg",width: 30,height: 30,),
          ],
        )
      ],
    );
  }
}
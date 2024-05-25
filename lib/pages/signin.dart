import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:26.0,top: 26.0,right: 26.0,bottom: 100.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Welcome Back \nNadun",style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/profile2.webp",width: 70,)
              ),
            ],
          ),
          SizedBox(height: 25,),
          TextField(
            decoration: InputDecoration(
              label: Text("Username"),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              label: Text("Passsword"),
              prefixIcon: Icon(Icons.key_outlined),
            ),
          ),

          SizedBox(height: 30,),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(230, 50)),
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            onPressed: (){}, 
            child: Text("Sign In",style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),)
          )
        ],
      ),
    );
  }
}
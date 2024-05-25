import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:26.0,top: 26.0,right: 26.0,bottom: 33.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("New \nAccount",style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                height: 1.30,
              ),),
      
              Spacer(),
              
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.black),
                      borderRadius: BorderRadius.circular(50)
                    ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt_outlined),
                          style: ButtonStyle(
                            iconSize: WidgetStatePropertyAll(30)
                          ),
                      ),
                    ),
                  Text("Upload Your Photo",style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 102, 102, 102),
                  ),),
                ],
              )
            ],
          ),
          SizedBox(height: 30,),

          TextField(
            decoration: InputDecoration(
              label: Text("Email: "),
              prefixIcon: Icon(Icons.email_outlined,),
            ),
          ),
          SizedBox(height: 10,),

          TextField(
            decoration: InputDecoration(
              label: Text("Username: "),
              prefixIcon: Icon(Icons.person,),
            ),
          ),
          SizedBox(height: 10,),

          TextField(
            decoration: InputDecoration(
              label: Text("password: "),
              prefixIcon: Icon(Icons.key,),
            ),
          ),

          SizedBox(height: 30,),

          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(230, 50)),
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            onPressed: (){}, 
            child: Text("Sign Up",style: TextStyle(
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

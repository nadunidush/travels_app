import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/welcomePage.webp"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Travel Around The World",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Welcome to Wanderlust, your ultimate travel companion! Wanderlust is designed to make your travel planning effortless and enjoyable. With our intuitive app, you can explore exciting destinations, book flights and accommodations, find local attractions, and create personalized itineraries all in one place"),
              Padding(
                padding: const EdgeInsets.only(left: 200,top: 30),
                child: ElevatedButton(
                  style:ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(30, 50)),
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 219, 164, 82)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      )
                    )
                  ),
                  onPressed: (){},
                  child: Icon(Icons.arrow_right_alt_rounded,size: 35,color: Colors.black,),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}

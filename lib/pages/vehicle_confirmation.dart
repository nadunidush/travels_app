import 'package:flutter/material.dart';
import 'dart:math';

import 'package:travels_app/pages/home.dart';

class VehicleConfirmation extends StatefulWidget {
  const VehicleConfirmation({super.key});

  @override
  State<VehicleConfirmation> createState() => _VehicleConfirmationState();
}

class _VehicleConfirmationState extends State<VehicleConfirmation> {
  int getRandomInteger() {
    final random = Random();
    return random.nextInt(100000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 244, 168, 54),
          iconTheme: IconThemeData(
            color: Colors.white,
            weight: 34,
            size: 30,
          ),
          title: Text(
            'Confirmation',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    "https://t3.ftcdn.net/jpg/05/66/60/32/360_F_566603211_eQVWq7TQfzJ1osI8AmwvifZ4WVFOXeRn.jpg",
                    width: 120,
                  )),
              Text(
                "Congratulations!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Your rent vehcile purchase\nsuccessfully completed!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 124, 116, 116)),
              ),
              SizedBox(height: 20,),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    "https://img.freepik.com/free-vector/buying-renting-new-used-speedy-sports-car_3446-651.jpg?w=360",width: 300,),
              ),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your Vehciel ID: ",style: TextStyle(fontSize: 18,),),
                  Text(getRandomInteger().toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),)
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 70.0, right: 70, top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsetsDirectional.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Color.fromARGB(255, 0, 119, 171),
                    ),
                    onPressed: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_left_outlined, color: Colors.white,size: 45,),
                        Text(
                          "Back To The Home",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class VehicleConfirmation extends StatelessWidget {
  const VehicleConfirmation({super.key});

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
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body:  Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network("https://t3.ftcdn.net/jpg/05/66/60/32/360_F_566603211_eQVWq7TQfzJ1osI8AmwvifZ4WVFOXeRn.jpg", width: 120,)
          ),

          Text("Congratulations!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text(
            "Your rent vehcile purchase\nsuccessfully completed!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: const Color.fromARGB(255, 124, 116, 116)),
          ),

          Image.network("https://img.freepik.com/free-vector/buying-renting-new-used-speedy-sports-car_3446-651.jpg?w=360"),
        ],
      )
    );
  }
}
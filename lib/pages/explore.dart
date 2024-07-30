import 'package:flutter/material.dart';
import 'package:travels_app/pages/plan_destination_flight.dart';
import 'package:travels_app/pages/plan_destination_vehicle.dart';
import 'package:travels_app/pages/select_signup_signin.dart';
import 'package:travels_app/auth/auth_services.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 244, 168, 54),
        actions: [
          Icon(
            Icons.search,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.menu_rounded,
            size: 40,
            color: Colors.white,
          ),
          Padding(padding: EdgeInsets.all(12.0))
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromARGB(255, 244, 168, 54),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.travel_explore_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            "Traveler",
                            style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Center(
                        child: ClipRRect(
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX2Jv0vepRhQiH_PwAkiKju-aFa82V1WL9QQ&s",width: 130,height: 130,fit: BoxFit.cover,),
                          borderRadius: BorderRadius.circular(80),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 255, left: 35),
                  child: Container(
                    height: 80,
                    width: 330,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 172, 172, 172)
                                    .withOpacity(0.3),
                                blurRadius: 15,
                                blurStyle: BlurStyle.outer,
                        // color:
                        //     Color.fromARGB(255, 239, 239, 239).withOpacity(0.3),
                      )
                    ], borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left:30.0,right: 30,bottom: 20),
                      child: Column(
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.directions_car_filled_outlined,
                                    color: Colors.purple,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DestinationVehicle()));
                                      },
                                      child: Text(
                                        "Vehicle",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              ),
                              Spacer(),
                              Container(height: 34,width: 2,color: Colors.grey,),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.flight,
                                    color: Colors.purple,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DestinationFlights()));
                                      },
                                      child: Text(
                                        "Flights",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Become A Member",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "SignIn or create a account",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.orange[300],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/homePageTravel.jpg",
                      width: 350,
                    )),
                Positioned(
                  top: 170,
                  left: 30,
                  child: Text(
                    "Travel the World",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
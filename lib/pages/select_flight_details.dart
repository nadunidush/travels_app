import 'package:flutter/material.dart';
import 'package:travels_app/pages/checkout.dart';

class FlightDetailsPage extends StatelessWidget {
  final String time;
  final int price;
  final String airlineFlightName;
  final String hours;
  final String category;
  final String flyingFrom;
  final String flyingTo;
  final String adults;
  final String children;

  const FlightDetailsPage({
    Key? key,
    required this.time,
    required this.price,
    required this.airlineFlightName,
    required this.hours,
    required this.category,
    required this.flyingTo,
    required this.flyingFrom,
    required this.adults,
    required this.children,
  }) : super(key: key);

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
          title: Text('Flight Details',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 189, 221, 247),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(250),
                        child: Image.network(
                          "https://static.vecteezy.com/system/resources/previews/000/619/645/non_2x/aircraft-airplane-airline-logo-label-journey-air-travel-airliner-symbol-vector-illustration.jpg",
                          width: 70,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${flyingFrom}",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Icon(
                              Icons.flight_takeoff_rounded,
                              size: 30,
                              weight: 100,
                            )),
                        Text(
                          "${hours}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${flyingTo}",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Time"),
                        Text(
                          "${time}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Fligh Name"),
                        Text(
                          "${airlineFlightName}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Adults"),
                        Text(
                          "${adults}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Childern"),
                        Text(
                          "${children}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Seat No"),
                        Text(
                          "20",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Ticket Price"),
                        Text(
                          "\$${price}",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "https://img.freepik.com/premium-photo/top-view-white-toy-airplane-model-blue-color-background-with-concept-travel_43448-317.jpg?w=360",
                              height: 300,
                            ))),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 110, right: 110, top: 20, bottom: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color.fromARGB(255, 244, 168, 54),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckOut(
                          price: price,
                        )));
                  },
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ));
  }
}

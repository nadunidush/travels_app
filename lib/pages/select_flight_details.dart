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

  const FlightDetailsPage({
    Key? key,
    required this.time,
    required this.price,
    required this.airlineFlightName,
    required this.hours,
    required this.category,
    required this.flyingTo,
    required this.flyingFrom,
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
          title: Text('Flight Details'),
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
                          "Canada",
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
                          "6h 30m",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Austriali",
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
                          "9:00a.m - 12:00a.m",
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
                          "International Air Line",
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
                          "01",
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
                          "02",
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
                          "\$730",
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
                              "https://w0.peakpx.com/wallpaper/247/87/HD-wallpaper-take-off-plane-sunset-view-thumbnail.jpg",
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
                        MaterialPageRoute(builder: (context) => CheckOut()));
                  },
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ));
  }
}

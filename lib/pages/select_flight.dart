import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travels_app/widgets/flight_arrive_card.dart';

class SelectFlight extends StatefulWidget {
  final String docId;
  const SelectFlight({super.key, required this.docId});

  @override
  State<SelectFlight> createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlight> {
  late Future<DocumentSnapshot> _flightDataFuture;

  @override
  void initState() {
    super.initState();
    _flightDataFuture = FirebaseFirestore.instance
        .collection('flights')
        .doc(widget.docId)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sampleFlights = [
      {
        'time': '6:30 - 15:00',
        'price': 340,
        'airlineFlightName': 'International Air Line',
        'hours': '6h 30m',
      },
      {
        'time': '8:00 - 12:30',
        'price': 280,
        'airlineFlightName': 'Global Airways',
        'hours': '4h 30m',
      },
      {
        'time': '11:00 - 17:45',
        'price': 400,
        'airlineFlightName': 'Sky High Airlines',
        'hours': '6h 45m',
      },
      // Add 7 more entries here
      {
        'time': '10:00 - 18:00',
        'price': 350,
        'airlineFlightName': 'Sunrise Airlines',
        'hours': '8h 00m',
      },
      {
        'time': '12:30 - 19:00',
        'price': 360,
        'airlineFlightName': 'Star Flights',
        'hours': '6h 30m',
      },
      {
        'time': '15:00 - 22:30',
        'price': 320,
        'airlineFlightName': 'Moon Air',
        'hours': '7h 30m',
      },
      {
        'time': '9:00 - 13:30',
        'price': 290,
        'airlineFlightName': 'Cloud Nine',
        'hours': '4h 30m',
      },
      {
        'time': '7:30 - 14:00',
        'price': 310,
        'airlineFlightName': 'Comet Flights',
        'hours': '6h 30m',
      },
      {
        'time': '16:00 - 23:30',
        'price': 370,
        'airlineFlightName': 'Aero Travels',
        'hours': '7h 30m',
      },
      {
        'time': '13:00 - 19:30',
        'price': 330,
        'airlineFlightName': 'Fly High',
        'hours': '6h 30m',
      },
    ];

    // Shuffle the list
    sampleFlights.shuffle();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30
        ),
        backgroundColor: const Color.fromARGB(255, 244, 168, 54),
        title: Text("Select Flight",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
          color: Colors.white,
        ),),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _flightDataFuture,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Flight not found'));
          }

          var flightData = snapshot.data!.data() as Map<String, dynamic>;
          String flyingFrom = flightData['flyingFrom'] ?? 'Unknown';
          String flyingTo = flightData['flyingTo'] ?? 'Unknown';
          String flightClass = flightData['flightClass'] ?? 'Unknown';
          String adult = flightData['adults'] ?? 'Unknown';
          String children = flightData['children'] ?? 'Unknown';

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.tune_sharp,
                          size: 29,
                          weight: 700,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.lightBlue,
                          foregroundColor: Colors.white),
                      onPressed: () {},
                      child: Text("Filters"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Flying from and flying to
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    flyingFrom,
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Image.asset(
                    "assets/flight_icon.png",
                    width: 30,
                    color: const Color.fromARGB(255, 244, 168, 54),
                  ),
                  Text(
                    flyingTo,
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),

              //Select one flight.
              Expanded(
                child: ListView.builder(
                  itemCount: sampleFlights.length,
                  itemBuilder: (context, index) {
                    var flight = sampleFlights[index];
                    return FlightArriveCard(
                      time: flight['time'],
                      price: flight['price'],
                      airlineFlightName: flight['airlineFlightName'],
                      hours: flight['hours'],
                      category: flightClass,
                      flyingFrom:flyingFrom,
                      flyingTo:flyingTo,
                      adult: adult,
                      children: children,

                    );
                  },
                ),
              ),
            ],
          );
        },
      ),

      //Bottomsheet of screen
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_sharp),
            label: "Trips",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Account",
          ),
        ],
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          height: 1.9,
        ),
        selectedItemColor: const Color.fromARGB(255, 244, 168, 54),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          height: 1.9,
        ),
        unselectedItemColor: Color.fromARGB(255, 145, 124, 124),
      ),
    );
  }
}

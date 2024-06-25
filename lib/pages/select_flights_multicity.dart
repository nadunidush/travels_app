import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travels_app/pages/multicity_selected_flight_details.dart';
import 'package:travels_app/widgets/flight_arive_card_multicity.dart';
import 'package:travels_app/widgets/flight_arrive_card.dart';

class SelectFlightsMulticity extends StatefulWidget {
  final List<Map<String, String>> flights;
  const SelectFlightsMulticity({super.key, required this.flights});

  @override
  State<SelectFlightsMulticity> createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlightsMulticity> {
  
  int currentFlightIndex = 0;
  List<Map<String, dynamic>> selectedFlights = [];
  late Future<DocumentSnapshot> _flightDataFuture;

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


  void _selectFlight(Map<String, dynamic> flight) {
    var currentFlight = widget.flights[currentFlightIndex];
    flight['flyingFrom'] = currentFlight['from'];
    flight['flyingTo'] = currentFlight['to'];
    flight['selectDate'] = currentFlight['date'];
    setState(() {
      selectedFlights.add(flight);
      if (currentFlightIndex < widget.flights.length - 1) {
        currentFlightIndex++;
      } else {
        _completeBooking();
      }
    });
  }

  void _completeBooking() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MulticitySelectedFlightDetails(selectedFlights: selectedFlights),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentFlight = widget.flights[currentFlightIndex];

    // Shuffle the list
    sampleFlights.shuffle();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30
        ),
        backgroundColor: const Color.fromARGB(255, 244, 168, 54),
        title: Text("Select Flight ${currentFlightIndex + 1}",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
          color: Colors.white,
        ),),
      ),
      body: Column(
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
                    "${currentFlight['from']}",
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
                    "${currentFlight['to']}",
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
                    return GestureDetector(
                      onTap: () => _selectFlight(flight),
                      child: FlightArriveCardMulticity(
                        time: flight['time'],
                        price: flight['price'],
                        airlineFlightName: flight['airlineFlightName'],
                        hours: flight['hours'],
                        category: "Business",
                        flyingFrom:"${currentFlight['from']}",
                        flyingTo:"${currentFlight['to']}",
                        selectdate: "${currentFlight['date']}",
                        adult: "1",
                        children: "0",
                      ),
                    );
                  },
                ),
              ),
            ],
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

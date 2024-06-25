import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travels_app/pages/select_flights_multicity.dart';
import 'package:travels_app/widgets/multi_city_card.dart';

class SearchMyltiCityFlight extends StatefulWidget {
  const SearchMyltiCityFlight({super.key});

  @override
  State<SearchMyltiCityFlight> createState() => _SearchMyltiCityFlightState();
}

class _SearchMyltiCityFlightState extends State<SearchMyltiCityFlight> {
  List<Map<String, String>> multiCityFlights = [
    {"from": "", "to": "", "date": ""}
  ];

  void _addMultiCityFligh() {
    setState(() {
       if(multiCityFlights.length < 5){
         multiCityFlights.add({"from": "", "to": "", "date": ""});
       }
    });
  }

  void _updateFlightFrom(String from, int index) { 
    setState(() {
      multiCityFlights[index]["from"] = from;
    });
  }

  void _updateFlightTo(String to, int index) {
    setState(() {
      multiCityFlights[index]["to"] = to;
    });
  }

  void _updateFlightDate(String date, int index) {
    setState(() {
      multiCityFlights[index]["date"] = date;
    });
  }

  Future<void> _saveSearchData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not logged!");
      return;
    }
    String uid = user.uid;
    CollectionReference flights =
        FirebaseFirestore.instance.collection('multicityFlights');
    for (var flight in multiCityFlights) {
      if (flight['from']!.isEmpty || flight['to']!.isEmpty || flight['date']!.isEmpty) {
        // Show an error message or handle the empty date case
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Flights details cannot be empty',style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      await flights.add({
        'flyingFrom': flight['from'],
        'flyingTo': flight['to'],
        'selectDate': flight['date'],
        'uid': uid,
      });
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SelectFlightsMulticity(flights: multiCityFlights,docId: flights.id,),
      ),
    );

    print("Data saved successfully.");
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: multiCityFlights.length,
                itemBuilder: (context, index) {
                  return MultiCityCard(
                    index: index,
                    onFromChanged: _updateFlightFrom,
                    onToChanged: _updateFlightTo,
                    onDateChanged: _updateFlightDate,
                  );
                }),
          ),
      
          //Add a fliight
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(350, 55),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: _addMultiCityFligh,
              child: Text(
                "Add A Flight",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 55),
                backgroundColor: const Color.fromARGB(255, 244, 168, 54),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: _saveSearchData,
            child: Text(
              "Search",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

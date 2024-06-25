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

  void _searchFlights() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectFlightsMulticity(flights: multiCityFlights,),
      ),
    );
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
            onPressed: _searchFlights,
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

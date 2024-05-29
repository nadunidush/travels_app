import 'package:flutter/material.dart';
import 'package:travels_app/widgets/select_button_flight.dart';

class SearchOneWayFlight extends StatefulWidget {
  const SearchOneWayFlight({super.key});

  @override
  State<SearchOneWayFlight> createState() => _SearchOneWayFlightState();
}

class _SearchOneWayFlightState extends State<SearchOneWayFlight> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),

                prefixIcon: Icon(Icons.flight_takeoff_rounded,
                    color: const Color.fromARGB(255, 8, 82, 142)),

                hintText: "Flying From",
                //label: Text("Flying From")
              ),
            ),
            SizedBox(
              height: 17,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),

                prefixIcon: Icon(Icons.flight_land_outlined,
                    color: const Color.fromARGB(255, 8, 82, 142)),

                hintText: "Flying To",
                //label: Text("Flying From")
              ),
            ),
            SizedBox(
              height: 17,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),

                prefixIcon: Icon(Icons.date_range_outlined,
                    color: const Color.fromARGB(255, 8, 82, 142)),

                hintText: "Select Date",
                //label: Text("Flying From")
              ),
            ),
            SizedBox(
              height: 17,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),

                prefixIcon: Icon(Icons.person_rounded,
                    color: const Color.fromARGB(255, 8, 82, 142)),

                hintText: "Adults",
                //label: Text("Flying From")
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 17,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),

                prefixIcon: Icon(Icons.child_care_rounded,
                    color: const Color.fromARGB(255, 8, 82, 142)),

                hintText: "Children",
                //label: Text("Flying From")
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 17,
            ),

            SelectButtonFlight(),

            SizedBox(height: 26,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 55),
                  backgroundColor:
                      const Color.fromARGB(255, 244, 168, 54),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {},
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
      ),
    );
  }
}
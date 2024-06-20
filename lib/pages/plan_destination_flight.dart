import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travels_app/widgets/search_multi_city_flight.dart';
import 'package:travels_app/widgets/search_one_way_flight.dart';
import 'package:travels_app/widgets/search_rounded_flight.dart';
import 'package:travels_app/widgets/select_button_flight.dart';

class DestinationFlights extends StatefulWidget {
  const DestinationFlights({super.key});

  @override
  State<DestinationFlights> createState() => _DestinationFlightsState();
}

class _DestinationFlightsState extends State<DestinationFlights> {
   

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
            size:30,
          ),
          backgroundColor: const Color.fromARGB(255, 244, 168, 54),
          title: Text("Search Flights", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: Colors.white
          ),),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TabBar(
                labelStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                indicatorColor: Color.fromARGB(255, 251, 196, 114),
                unselectedLabelColor: Colors.black,
                labelColor: Color.fromRGBO(255, 181, 70, 1),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(child: Text("Rounded Trip")),
                  Tab(child: Text("One Way")),
                  Tab(child: Text("Multy City")),
                ]),
            Expanded(
              child: TabBarView(children: [

                //First Tab
                SearchRoundedFlight(),
                
                //second Tab
                SearchOneWayFlight(),

                //Third Tab
                SearchMyltiCityFlight(),
              ]),
            )
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
              label: "Acount",
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
      ),
    );
  }
}

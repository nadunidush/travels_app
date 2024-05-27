import 'package:flutter/material.dart';
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(45),
            child: Padding(
              padding: const EdgeInsets.only(left: 26, bottom: 16, top: 16),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Flights",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
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
                Padding(
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

                            hintText: "Select Dates",
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
                ),
                Text("hello world"),
                Text("welcome to the nadun")
              ]),
            )
          ],
        ),
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

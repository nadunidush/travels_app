import 'package:flutter/material.dart';

class SelectFlight extends StatefulWidget {
  const SelectFlight({super.key});

  @override
  State<SelectFlight> createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Select Flights",
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
                  child: Text("Fliters"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //Flying from and flying to
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              Text(
                "London",
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Image.asset(
                "assets/flight_icon.png",
                width: 30,
                color: const Color.fromARGB(255, 244, 168, 54),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Berlin",
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          //Select one flight.
          Padding(
            padding: const EdgeInsets.only(left:24.0,right: 24.0,top: 13),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 231, 230, 230),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("06:30 - 15:00",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),),
                        Text("\$320",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 18, 86, 18)
                        ),),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Text("International Air Lines",style: TextStyle(color: const Color.fromARGB(255, 118, 117, 117),fontWeight: FontWeight.w500),),
                    Text("6h 40m",style: TextStyle(color: const Color.fromARGB(255, 118, 117, 117),fontWeight: FontWeight.w500),),
                    Text("Economy",style: TextStyle(color: const Color.fromARGB(255, 118, 117, 117),fontWeight: FontWeight.w500),),
                  ]
                ),
              ),
            ),
          ),

          //Select one flight.
          Padding(
            padding: const EdgeInsets.only(left:24.0,right: 24.0,top: 13),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 231, 230, 230),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("06:30 - 15:00",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),),
                        Text("\$320",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 18, 86, 18)
                        ),),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Text("International Air Lines",style: TextStyle(color: const Color.fromARGB(255, 118, 117, 117),fontWeight: FontWeight.w500),),
                    Text("6h 40m",style: TextStyle(color: const Color.fromARGB(255, 118, 117, 117),fontWeight: FontWeight.w500),),
                    Text("Economy",style: TextStyle(color: const Color.fromARGB(255, 118, 117, 117),fontWeight: FontWeight.w500),),
                  ]
                ),
              ),
            ),
          ),

          //Select one flight.
          Padding(
            padding: const EdgeInsets.only(left:24.0,right: 24.0,top: 13,),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 231, 230, 230),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("06:30 - 15:00",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),),
                        Text("\$320",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 18, 86, 18)
                        ),),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Text("International Air Lines",style: TextStyle(color: const Color.fromARGB(255, 118, 117, 117),fontWeight: FontWeight.w500),),
                    Text("6h 40m",style: TextStyle(color: const Color.fromARGB(255, 118, 117, 117),fontWeight: FontWeight.w500),),
                    Text("Economy",style: TextStyle(color: const Color.fromARGB(255, 118, 117, 117),fontWeight: FontWeight.w500),),
                  ]
                ),
              ),
            ),
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
    );
  }
}

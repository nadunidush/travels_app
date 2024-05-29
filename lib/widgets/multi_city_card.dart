import 'package:flutter/material.dart';

class MultiCityCard extends StatelessWidget {
  const MultiCityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Expanded(
                child: TextField(
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
                  ),
                ),
              ),
              
              SizedBox(width: 8,),
              Expanded(
                child: TextField(
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
              ),
          ],
        ),
        SizedBox(height: 10,),
        Container(
          width: 170,
          child: TextField(
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
        ),
        SizedBox(height: 40,),
      ],
    );
  }
}
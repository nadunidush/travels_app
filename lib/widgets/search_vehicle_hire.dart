import 'package:flutter/material.dart';

class SearchVehicleHire extends StatefulWidget {
  const SearchVehicleHire({super.key});

  @override
  State<SearchVehicleHire> createState() => _SearchVehicleHireState();
}

class _SearchVehicleHireState extends State<SearchVehicleHire> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [

          //Vehiclefrom
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 224, 224, 223),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.directions_car_filled_outlined,
                  color: const Color.fromARGB(255, 8, 82, 142)),
              hintText: "From",
            ),
          ),
          
          SizedBox(height: 15,),
          //fromtime
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 224, 224, 223),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.access_time_outlined,
                  color: const Color.fromARGB(255, 8, 82, 142)),
              hintText: "Time",
            ),
          ),

          SizedBox(height: 35,),
          //VehicleTo
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 224, 224, 223),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.directions_car_rounded,
                  color: const Color.fromARGB(255, 8, 82, 142)),
              hintText: "To",
            ),
          ),
          
          SizedBox(height: 15,),
          //ToTime
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 224, 224, 223),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.access_time_outlined,
                  color: const Color.fromARGB(255, 8, 82, 142)),
              hintText: "Time",
            ),
          ),

          SizedBox(height: 35,),
          //vehicleType
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 224, 224, 223),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.arrow_downward_outlined,
                  color: const Color.fromARGB(255, 8, 82, 142)),
              hintText: "Vehicle Type",
            ),
          ),

          SizedBox(height: 35,),
          //vehicleLocation
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 224, 224, 223),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.location_on_outlined,
                  color: const Color.fromARGB(255, 8, 82, 142)),
              hintText: "Vehicle Type",
            ),
          ),

          SizedBox(height: 35,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 55),
                  backgroundColor: const Color.fromARGB(255, 244, 168, 54),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {},
              child: Text(
                "Search Vehicle Hire",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
          )
        ],
      ),
    );
  }
}
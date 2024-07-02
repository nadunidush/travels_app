import 'package:flutter/material.dart';
import 'package:travels_app/pages/book_car_hire.dart';

class SearchVehicleHire extends StatefulWidget {
  const SearchVehicleHire({super.key});

  @override
  State<SearchVehicleHire> createState() => _SearchVehicleHireState();
}

class _SearchVehicleHireState extends State<SearchVehicleHire> {
  String? valueChoose;
  List listItems = ["Car", "Van", "Bus", "Truck"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

          SizedBox(
            height: 15,
          ),
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

          SizedBox(
            height: 35,
          ),
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

          SizedBox(
            height: 15,
          ),
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

          SizedBox(
            height: 35,
          ),
          //vehicleType
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 20, top: 6, bottom: 6),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 224, 224, 223),
              ),
              child: DropdownButton(
                  hint: Text("Vehicle Type"),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  dropdownColor: const Color.fromARGB(255, 244, 168, 54),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  underline: SizedBox(),
                  value: valueChoose,
                  items: listItems.map((valueItem) {
                    return DropdownMenuItem(
                      child: Text(valueItem),
                      value: valueItem,
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue as String?;
                    });
                  }),
            ),
          ),

          SizedBox(
            height: 35,
          ),
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
              hintText: "Trip Location",
            ),
          ),

          SizedBox(
            height: 35,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 55),
                backgroundColor: const Color.fromARGB(255, 244, 168, 54),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookCarHire()));
            },
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

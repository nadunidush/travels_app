import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travels_app/pages/book_bus_hire.dart';
import 'package:travels_app/pages/book_car_hire.dart';
import 'package:travels_app/pages/book_van_hire.dart';

class SearchDriverWithVehicle extends StatefulWidget {
  const SearchDriverWithVehicle({super.key});

  @override
  State<SearchDriverWithVehicle> createState() => _SearchDriverWithVehicleState();
}

class _SearchDriverWithVehicleState extends State<SearchDriverWithVehicle> {
  final fromVehicleController = TextEditingController();
  final fromTimeController = TextEditingController();
  final toVehicleController = TextEditingController();
  final toTimeController = TextEditingController();
  final pickUpLocationController = TextEditingController();
  final tripLocationController = TextEditingController();

  String? valueChoose;
  List listItems = ["Car", "Van", "Bus",];

  @override
  void dispose() {
    fromVehicleController.dispose();
    fromTimeController.dispose();
    toVehicleController.dispose();
    toTimeController.dispose();
    pickUpLocationController.dispose();
    tripLocationController.dispose();
    super.dispose();
  }

  Future<void> _saveSearchOnlyVehicleData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not logged in.");
      return;
    }

    if (fromVehicleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'PickUp Date cannot be empty',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
      return;
    } else if (fromTimeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'PickUp time cannot be empty',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
      return;
    } else if (toVehicleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Return date cannot be empty',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
      return;
    } else if (toTimeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Return time cannot be empty',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
      return;
    }else if(pickUpLocationController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'PickUp Location cannot be empty',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
      return;
    }else if (valueChoose == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Vehicle type cannot be empty',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
      return;
    } else if (tripLocationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Trip Location cannot be empty',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
      return;
    }

    String uid = user.uid;
    String fromVehicle = fromVehicleController.text;
    String fromTime = fromTimeController.text;
    String toVehicle = toVehicleController.text;
    String toTime = toTimeController.text;
    String pickUpLocation = pickUpLocationController.text;
    String vehicleType = valueChoose as String;
    String tripLocation = tripLocationController.text;

    DocumentReference docRef =
        await FirebaseFirestore.instance.collection("searchDriverWithVehicle").add({
      'from': fromVehicle,
      'fromTime': fromTime,
      'to': toVehicle,
      'toTime': toTime,
      'pickupLocation': pickUpLocation,
      'vehicleType': valueChoose,
      'tripLocation': tripLocation,
      'uid': uid,
    });

    if (valueChoose == "Car") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookCarHire(
                    docId: docRef.id,
                  )));
    }
    if (valueChoose == "Van") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookVanHire(
                    docId: docRef.id,
                  )));
    }
    if (valueChoose == "Bus") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookBusHire(
                    docId: docRef.id,
                  )));
    }


    print("Data saved successfully.");
  }

  //datepicker pickup
  Future<void> _selectPickUpDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 2)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        fromVehicleController.text = picked.toString().split(" ")[0];
      });
    }
  }

  //datepicker return
  Future<void> _selectReturnDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 2)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        toVehicleController.text = picked.toString().split(" ")[0];
      });
    }
  }

  //pick the pickup time
  Future<void> _selectPickUpTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        fromTimeController.text = picked.format(context);
      });
    }
  }

  //pick the return time
  Future<void> _selectReturnTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        toTimeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Vehiclefrom
            TextFormField(
              controller: fromVehicleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.calendar_today_outlined,
                    color: const Color.fromARGB(255, 8, 82, 142)),
                hintText: "Pickup Date",
              ),
              readOnly: true,
              onTap: () {
                _selectPickUpDate();
              },
            ),

            SizedBox(
              height: 15,
            ),
            //fromtime
            TextFormField(
              controller: fromTimeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.access_time_outlined,
                    color: const Color.fromARGB(255, 8, 82, 142)),
                hintText: "Pickup Time",
              ),
              readOnly: true,
              onTap: () {
                _selectPickUpTime();
              },
            ),

            SizedBox(
              height: 35,
            ),
            //VehicleTo
            TextFormField(
              controller: toVehicleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.calendar_today_outlined,
                    color: const Color.fromARGB(255, 8, 82, 142)),
                hintText: "Returns Date",
              ),
              readOnly: true,
              onTap: () {
                _selectReturnDate();
              },
            ),

            SizedBox(
              height: 15,
            ),
            //ToTime
            TextFormField(
              controller: toTimeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.access_time_outlined,
                    color: const Color.fromARGB(255, 8, 82, 142)),
                hintText: "Return Time",
              ),
              readOnly: true,
              onTap: () {
                _selectReturnTime();
              },
            ),

            SizedBox(
              height: 35,
            ),

            TextFormField(
              controller: pickUpLocationController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.location_on_outlined,
                    color: const Color.fromARGB(255, 8, 82, 142)),
                hintText: "PickUp Location",
              ),
            ),

            SizedBox(
              height: 35,
            ),
            //vehicleType
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, right: 20, top: 6, bottom: 6),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 223),
                ),
                child: DropdownButton(
                    hint: Text("Vehicle Type"),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    dropdownColor: Color.fromARGB(255, 224, 224, 223),
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
              controller: tripLocationController,
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
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 55),
                  backgroundColor: const Color.fromARGB(255, 244, 168, 54),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: _saveSearchOnlyVehicleData,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travels_app/pages/select_flight.dart';
import 'package:travels_app/widgets/select_button_flight.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchOneWayFlight extends StatefulWidget {
  const SearchOneWayFlight({super.key});

  @override
  State<SearchOneWayFlight> createState() => _SearchOneWayFlightState();
}

class _SearchOneWayFlightState extends State<SearchOneWayFlight> {
  final _flyingFromController = TextEditingController();
  final _flyingToController = TextEditingController();
  final _adultController = TextEditingController();
  final _childernController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  DateTime? _selectedDate;
  int _selectedButtonIndex = -1;
  String _selectedFlightClass = '';

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now().add(Duration(days: 2)),
      firstDate: DateTime.now().add(Duration(days: 2)),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        _dateController.text = formatter.format(picked);
      });
    }
  }

  Future<void> _saveSearchData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not logged!");
      return;
    }

    String uid = user.uid;
    String flyingFrom = _flyingFromController.text;
    String flyingTo = _flyingToController.text;
    String adults = _adultController.text;
    String children = _childernController.text;
    String dateRange = _dateController.text;

    if (flyingFrom.isEmpty) {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Flight From cannot be empty',style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            backgroundColor: Colors.red,
          ),
        );
         return;
    }
    if (flyingTo.isEmpty) {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Flight To cannot be empty',style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            backgroundColor: Colors.red,
          ),
        );
         return;
    };
    if (adults.isEmpty) {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Adult cannot be empty',style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            backgroundColor: Colors.red,
          ),
        );
         return;
       };
       
    if (children.isEmpty) {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Childern cannot be empty',style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            backgroundColor: Colors.red,
          ),
        );
         return null;
       };

    DocumentReference docRef =
        await FirebaseFirestore.instance.collection("flights").add({
      'flyingFrom': flyingFrom,
      'flyingTo': flyingTo,
      'adults': adults,
      'children': children,
      'select_date': dateRange,
      'uid': uid,
      'flightClass': _selectedFlightClass,
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectFlight(
          docId: docRef.id,
        ),
      ),
    );
    print("Data saved successfully.");
  }

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
            TextFormField(
              controller: _flyingFromController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Flying From cannot be empty';
                }
              },
            ),
            SizedBox(
              height: 17,
            ),
            TextFormField(
              controller: _flyingToController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Flying To cannot be empty';
                }
              },
            ),
            SizedBox(
              height: 17,
            ),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 224, 224, 223),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),

                prefixIcon: Icon(Icons.date_range_outlined,
                    color: const Color.fromARGB(255, 8, 82, 142)),

                suffixIcon: IconButton(
                    onPressed: () => _selectDate(context),
                    icon: Icon(Icons.calendar_today)),

                hintText: "Select Date",
                //label: Text("Flying From")
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Date cannot be empty';
                }
              },
            ),
            SizedBox(
              height: 17,
            ),
            TextFormField(
              controller: _adultController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adults cannot be empty';
                }
              },
            ),
            SizedBox(
              height: 17,
            ),
            TextFormField(
              controller: _childernController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Children cannot be empty';
                }
              },
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: _getButtonStyle(0),
                  onPressed: () {
                    _onButtonPressed(0);
                    setState(() {
                      _selectedFlightClass = 'Economy';
                    });
                  },
                  child: Text(
                    "Economy",
                  ),
                ),
                ElevatedButton(
                  style: _getButtonStyle(1),
                  onPressed: () {
                    _onButtonPressed(1);
                    setState(() {
                      _selectedFlightClass = 'Business';
                    });
                  },
                  child: Text(
                    "Business",
                  ),
                ),
                ElevatedButton(
                  style: _getButtonStyle(2),
                  onPressed: () {
                    _onButtonPressed(2);
                    setState(() {
                      _selectedFlightClass = 'FirstClass';
                    });
                  },
                  child: Text(
                    "FirstClass",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 26,
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
      ),
    );
  }

  ButtonStyle _getButtonStyle(int index) {
    bool isSelected = _selectedButtonIndex == index;
    bool isOtherButtonSelected = _selectedButtonIndex != -1 && !isSelected;

    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      backgroundColor: isSelected
          ? const Color.fromARGB(255, 8, 82, 142)
          : (isOtherButtonSelected
              ? Colors.white
              : const Color.fromARGB(255, 8, 82, 142)),
      foregroundColor: isSelected
          ? Colors.white
          : (isOtherButtonSelected
              ? const Color.fromARGB(255, 8, 82, 142)
              : Colors.white),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travels_app/widgets/select_button_flight.dart';
import 'package:intl/intl.dart';

class SearchOneWayFlight extends StatefulWidget {
  const SearchOneWayFlight({super.key});

  @override
  State<SearchOneWayFlight> createState() => _SearchOneWayFlightState();
}

class _SearchOneWayFlightState extends State<SearchOneWayFlight> {
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
      initialDate: _selectedDate ?? DateTime.now(),
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
              //keyboardType: TextInputType.datetime,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: _getButtonStyle(0),
                  onPressed: () {
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

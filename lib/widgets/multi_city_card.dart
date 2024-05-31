import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MultiCityCard extends StatefulWidget {
  const MultiCityCard({super.key});

  @override
  State<MultiCityCard> createState() => _MultiCityCardState();
}

class _MultiCityCardState extends State<MultiCityCard> {
  final TextEditingController _dateController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
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
          width: 190,
          child: TextField(
            readOnly: true,
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
                icon: Icon(Icons.calendar_today)
              ),
          
              hintText: "Select Date",
              //label: Text("Flying From")
            ),
            onTap: () => _selectDate(context),
          ),
        ),
        SizedBox(height: 40,),
      ],
    );
  }
}
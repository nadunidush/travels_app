import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MultiCityCard extends StatefulWidget {
  final int index;
  final Function(String, int) onFromChanged;
  final Function(String, int) onToChanged;
  final Function(String, int) onDateChanged;
  const MultiCityCard({
    super.key,
    required this.index,
    required this.onFromChanged,
    required this.onToChanged,
    required this.onDateChanged,
  });

  @override
  State<MultiCityCard> createState() => _MultiCityCardState();
}

class _MultiCityCardState extends State<MultiCityCard> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void dispose() {
    _dateController.dispose();
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
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
        widget.onDateChanged(_dateController.text, widget.index);
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
              child: TextFormField(
                controller: _fromController,
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
                onChanged: (value) {
                  widget.onFromChanged(value, widget.index);},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Flying From cannot be empty';
                  }
                },
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextFormField(
                controller: _toController,
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
                onChanged: (value) {
                  widget.onToChanged(value, widget.index);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Flying To cannot be empty';
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 190,
          child: TextFormField(
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
                  icon: Icon(Icons.calendar_today)),

              hintText: "Select Date",
              //label: Text("Flying From")
            ),
            onTap: () => _selectDate(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Date cannot be empty';
              }
            },
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

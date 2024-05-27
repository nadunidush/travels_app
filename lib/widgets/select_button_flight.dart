import 'package:flutter/material.dart';

class SelectButtonFlight extends StatefulWidget {
  const SelectButtonFlight({super.key});

  @override
  State<SelectButtonFlight> createState() => _SelectButtonFlightState();
}

class _SelectButtonFlightState extends State<SelectButtonFlight> {
  int _selectedButtonIndex = -1;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: _getButtonStyle(0),
          onPressed: () => _onButtonPressed(0),
          child: Text("Economy",),
        ),
        ElevatedButton(
          style: _getButtonStyle(1),
          onPressed: () => _onButtonPressed(1),
          child: Text("Business",),
        ),
        ElevatedButton(
          style: _getButtonStyle(2),
          onPressed: () => _onButtonPressed(2),
          child: Text("FirstClass",),
        ),
      ],
    );
  }

  ButtonStyle _getButtonStyle(int index) {
    bool isSelected = _selectedButtonIndex == index;
    bool isOtherButtonSelected = _selectedButtonIndex != -1 && !isSelected;

    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      backgroundColor: isSelected ? const Color.fromARGB(255, 8, 82, 142) : (isOtherButtonSelected ? Colors.white : const Color.fromARGB(255, 8, 82, 142)),
      foregroundColor: isSelected ? Colors.white : (isOtherButtonSelected ? const Color.fromARGB(255, 8, 82, 142): Colors.white),
    );
  }
}

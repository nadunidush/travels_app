import 'package:flutter/material.dart';
import 'package:travels_app/pages/select_flight_details.dart';

class FlightArriveCardMulticity extends StatelessWidget {
  final String time;
  final int price;
  final String airlineFlightName;
  final String hours;
  final String category;
  final String flyingFrom;
  final String flyingTo;
  final String adult;
  final String children;
  final String selectdate;

  const FlightArriveCardMulticity({
    super.key,
    required this.time,
    required this.price,
    required this.airlineFlightName,
    required this.hours,
    required this.category,
    required this.flyingTo,
    required this.flyingFrom,
    required this.adult,
    required this.children,
    required this.selectdate,
  });

  @override
  Widget build(BuildContext context) {
    bool isTextVisible = false; // Change this flag to hide or show the text
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 13),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 231, 230, 230),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "\$$price",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 18, 86, 18)),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              airlineFlightName,
              style: TextStyle(
                  color: const Color.fromARGB(255, 118, 117, 117),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              selectdate,
              style: TextStyle(
                  color: const Color.fromARGB(255, 118, 117, 117),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              hours,
              style: TextStyle(
                  color: const Color.fromARGB(255, 118, 117, 117),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              category,
              style: TextStyle(
                  color: const Color.fromARGB(255, 118, 117, 117),
                  fontWeight: FontWeight.w500),
            ),
            isTextVisible
                ? Text(
                    adult,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 118, 117, 117),
                        fontWeight: FontWeight.w500),
                  )
                : Container(),
            isTextVisible
                ? Text(
                    children,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 118, 117, 117),
                        fontWeight: FontWeight.w500),
                  )
                : Container(),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travels_app/widgets/multi_city_card.dart';

class SearchMyltiCityFlight extends StatefulWidget {
  const SearchMyltiCityFlight({super.key});

  @override
  State<SearchMyltiCityFlight> createState() => _SearchMyltiCityFlightState();
}

class _SearchMyltiCityFlightState extends State<SearchMyltiCityFlight> {
  List multiCityFlightForm = [MultiCityCard()];

  void _addMultiCityFligh() {
    setState(() {
      multiCityFlightForm.add(MultiCityCard());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Expanded(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: multiCityFlightForm.length,
                  itemBuilder: (context, index) {
                    return multiCityFlightForm[index];
                  }),
            ),

            //Add a fliight
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(350, 55),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: _addMultiCityFligh,
                child: Text(
                  "Add A Flight",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                )),
            SizedBox(
              height: 10,
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
}

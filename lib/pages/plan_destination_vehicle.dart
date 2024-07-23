import 'package:flutter/material.dart';
import 'package:travels_app/widgets/search_driver_with_vehicle.dart';
import 'package:travels_app/widgets/search_vehicle_hire.dart';

class DestinationVehicle extends StatefulWidget {
  const DestinationVehicle({super.key});

  @override
  State<DestinationVehicle> createState() => _DestinationVehicleState();
}

class _DestinationVehicleState extends State<DestinationVehicle> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 244, 168, 54),
          iconTheme: IconThemeData(
            size: 30,
            color: Colors.white
          ),
          title: const Text('Search Vehicle', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Colors.white
            ),),
        ),
      
        body: Column(
          children: [
            TabBar(
              labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              labelColor: Color.fromARGB(255, 244, 168, 54),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              indicatorColor: Color.fromARGB(255, 244, 168, 54),
              indicatorSize: TabBarIndicatorSize.label,
               tabs: [
                Tab(text: 'Only Vehicle Hire'),
                Tab(text: "Vehicle Hire With Driver"),
               ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                   SearchVehicleHire(),
                   SearchDriverWithVehicle(),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
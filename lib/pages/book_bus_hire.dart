import 'package:flutter/material.dart';
import 'package:travels_app/widgets/onlyCarCard.dart';

class BookBusHire extends StatefulWidget {
  String docId;
  BookBusHire({super.key, required this.docId});

  @override
  State<BookBusHire> createState() => _BookBusHireState();
}

class _BookBusHireState extends State<BookBusHire> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> renteralBuses = [
      {
        'carImage':
            'https://fuso.com.ph/wp-content/uploads/2019/06/Light-Bus.jpg',
        'carName': '(A/C)Bus Coaster Rosa',
        'carLogo':
            'https://i.pinimg.com/736x/5d/98/c8/5d98c8d1a5e51fe70d189d717493315f.jpg',
        'carRentPrice': 18000,
        'carKm': "150",
      },
      {
        'carImage':
            'https://www.toyota.lk/wp-content/uploads/2017/03/1BUS-1.jpg',
        'carName': "Box Coaster Super Luxury",
        'carLogo':
            'https://global.toyota/pages/global_toyota/mobility/toyota-brand/emblem_001.jpg',
        'carRentPrice': 19500,
        'carKm': '150',
      },
      {
        'carImage':
            'https://s.alicdn.com/@sc04/kf/He4dc8a3dad854e89acc5c419a18afc32J.jpg_300x300.jpg',
        'carName': '50 Seater Under Luggage',
        'carLogo':
            'https://i.pinimg.com/736x/18/7b/d3/187bd3be779a48a238a765e0c2de8bac.jpg',
        'carRentPrice': 21000,
        'carKm': '150'
      },
      {
        'carImage':
            'https://s.alicdn.com/@sc04/kf/A53d6f69cebf44893946ef604161a9a71Z.jpg_720x720q50.jpg',
        'carName': '45 Seats Luxury Bus',
        'carLogo':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqdOGIb6RpYTOQiJYakyS6c_D34nI-kRdXaA&s',
        'carRentPrice': 23500,
        'carKm': "150"
      },
      {
        'carImage':
            'https://image.made-in-china.com/2f0j00UEPRLgWGztqr/Slk6126-New-Passenger-Bus-with-Luxury-VIP-Bus-Seat.webp',
        'carName': 'VIP Luxury Bus',
        'carLogo':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjtHBg5t7MZNY-xzpPVMNjp7SNgWLz85nBEA&s',
        'carRentPrice': 28000,
        'carKm': "150"
      },
    ];
    renteralBuses.shuffle();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          title: const Text('Book A vehicle',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 244, 168, 54),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Bus Hire",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: renteralBuses.length,
                    itemBuilder: (context, index) {
                      var cars = renteralBuses[index];
                      return OnlyCarCard(
                          carImage: cars['carImage'],
                          carName: cars['carName'],
                          carLogo: cars['carLogo'],
                          carRentPrice: cars['carRentPrice'],
                          carKm: cars['carKm'],
                          docId: widget.docId);
                    }),
              )
            ],
          ),
        ));
  }
}

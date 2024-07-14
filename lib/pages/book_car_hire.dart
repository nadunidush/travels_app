import 'package:flutter/material.dart';
import 'package:travels_app/pages/book_vehicle_details.dart';
import 'package:travels_app/widgets/onlyCarCard.dart';

class BookCarHire extends StatefulWidget {
  String docId;
  BookCarHire({super.key, required this.docId});

  @override
  State<BookCarHire> createState() => _BookCarHireState();
}

class _BookCarHireState extends State<BookCarHire> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> renteralCars = [
      {
        'carImage':
            'https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?cs=srgb&dl=pexels-mikebirdy-3729464.jpg&fm=jpg',
        'carName': 'Mercedes AMG GT',
        'carLogo':
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Mercedes-Logo.svg/2048px-Mercedes-Logo.svg.png',
        'carRentPrice': 8000,
        'carKm': "100",
      },
      {
        'carImage':
            'https://i.pinimg.com/736x/2f/2f/ae/2f2faefce2fd6aec4d8176aaa9c8533a.jpg',
        'carName': "Perodua Viva Elite",
        'carLogo':
            'https://lezebre.lu/images/detailed/17/30415-Perodua-Viva.png',
        'carRentPrice': 6000,
        'carKm': '100',
      },
      {
        'carImage':
            'https://www.marill-automotive.com/media/gamme/modeles/images/169fb05ed43e3484862610b8f36db957.png',
        'carName': 'Toyota Belta',
        'carLogo':
            'https://global.toyota/pages/global_toyota/mobility/toyota-brand/emblem_001.jpg',
        'carRentPrice': 7500,
        'carKm': '150'
      },
      {
        'carImage':
            'https://prestigemotorsport.com.au/wp-content/uploads/2019/04/Mazda-3-hybrid-Axela-hybrid-blue.jpg',
        'carName': 'Mazda Axela',
        'carLogo':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWN1rvq_omv60f1FU73SuY0EgX5_NkJBfJZA&s',
        'carRentPrice': 8300,
        'carKm': "120"
      },
      {
        'carImage':
            'https://www.batfa.com/photo-newcar-allion-colors.files/Allion-color-WhitePearlCrystalShine420.jpg',
        'carName': 'Toyota Allion',
        'carLogo':
            'https://global.toyota/pages/global_toyota/mobility/toyota-brand/emblem_001.jpg',
        'carRentPrice': 7000,
        'carKm': "100"
      },
      {
        'carImage':
            'https://global.honda/content/dam/site/global-en/newsroom-new/cq_img/news/2013/4130905fit/01.jpg',
        'carName': 'Honda Fit',
        'carLogo':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoxL6O0oj4Q1V4TzDy2IlYuRnrQ4plaOtKiA&s',
        'carRentPrice': 6500,
        'carKm': "100"
      }
    ];
    renteralCars.shuffle();
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
                "Car Hire",
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
                    itemCount: renteralCars.length,
                    itemBuilder: (context, index) {
                      var cars = renteralCars[index];
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

import 'package:flutter/material.dart';
import 'package:travels_app/pages/book_vehicle_details.dart';
import 'package:travels_app/widgets/onlyCarCard.dart';

class BookVanHire extends StatefulWidget {
  String docId;
  BookVanHire({super.key, required this.docId});

  @override
  State<BookVanHire> createState() => _BookVanHireState();
}

class _BookVanHireState extends State<BookVanHire> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> renteralCars = [
      {
        'carImage':
            'https://www.toyota.ht/wp-content/uploads/2018/07/toyota-hiace.jpg',
        'carName': 'Toyota Hiace ',
        'carLogo':
            'https://i.pinimg.com/originals/36/56/ab/3656ab097dace4c437d105486f8da4a2.png',
        'carRentPrice': 6500,
        'carKm': "110",
      },
      {
        'carImage':
            'https://cars.japanesecartrade.com/vehicle_image/10553003_201906z.jpg',
        'carName': "Susuki every buddy",
        'carLogo':
            'https://static.vecteezy.com/system/resources/previews/020/927/418/non_2x/suzuki-logo-brand-car-symbol-with-name-black-design-japan-automobile-illustration-free-vector.jpg',
        'carRentPrice': 5800,
        'carKm': '100',
      },
      {
        'carImage':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-BmQPiDLCb8jvJC4mTTzTnfo1Si6cgdtcDQ&s',
        'carName': 'KDH Van',
        'carLogo':
            'https://global.toyota/pages/global_toyota/mobility/toyota-brand/emblem_001.jpg',
        'carRentPrice': 8500,
        'carKm': '150'
      },
      {
        'carImage':
            'https://www.lankaholidays.com/pics/36529/1476068087397Toyota_Hiace_100_long_van_007.JPG',
        'carName': 'Toyota Dolphin Van',
        'carLogo':
            'https://global.toyota/pages/global_toyota/mobility/toyota-brand/emblem_001.jpg',
        'carRentPrice': 7400,
        'carKm': "120"
      },
      {
        'carImage':
            'https://wieck-nissanao-production.s3.amazonaws.com/photos/577beb9ca0c0e6013c0ed7383ec5c510c9140a73/preview-768x432.jpg',
        'carName': 'Nissan Caravan Super DX',
        'carLogo':
            'https://w0.peakpx.com/wallpaper/817/465/HD-wallpaper-nissan-logo-logo-nissan.jpg',
        'carRentPrice': 9000,
        'carKm': "100"
      },
      {
        'carImage':
            'https://wecaretaxi.com/wp-content/uploads/2023/01/toyota-kdh-high-roof-van-rental-e1673451018692.png',
        'carName': 'Toyota KDH High Roof ',
        'carLogo':
            'https://global.toyota/pages/global_toyota/mobility/toyota-brand/emblem_001.jpg',
        'carRentPrice': 10500,
        'carKm': "130"
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
                "Van Hire",
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

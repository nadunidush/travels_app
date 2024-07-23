import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travels_app/pages/checkout.dart';

class BookCarDetails extends StatefulWidget {
  String carName;
  int carRentPrice;
  String carKm;
  String docId;
  BookCarDetails(
      {super.key,
      required this.carName,
      required this.carRentPrice,
      required this.carKm,
      required this.docId});

  @override
  State<BookCarDetails> createState() => _BookCarDetailsState();
}

class _BookCarDetailsState extends State<BookCarDetails> {
  late Future<DocumentSnapshot> _vehicleDataFuture;

  @override
  void initState() {
    super.initState();
    _vehicleDataFuture = FirebaseFirestore.instance
        .collection('searchOnlyVehicle')
        .doc(widget.docId)
        .get();
  }
  List<Map<String, String>> images = [
    {
      'carName': 'Mercedes AMG GT',
      '1':
          'https://hips.hearstapps.com/hmg-prod/images/2024-mercedes-amg-gt-coupe-interior-122-64da40b809fe6.jpg',
      '2':
          'https://hips.hearstapps.com/hmg-prod/images/2024-mercedes-amg-gt-coupe-interior-120-64da40b774dd2.jpg?crop=1xw:1xh;center,top&resize=980:*',
      '3':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7Ym2D7JEH1bYNqVYQ-jiwyV3ZKX8FnPGtTQ&s',
    },
    {
      'carName': 'Toyota Belta',
      '1': 'https://www.gari.pk/images/new/cars/2022-02/1543_1_27933.jpg',
      '2':
          'https://stimg.cardekho.com/images/carinteriorimages/930x620/Toyota/Belta/8705/1638349818088/dashboard-59.jpg?impolicy=resize&imwidth=420',
      '3':
          'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/ExtraImages/20211119040309_Toyota_Belta_4.jpg&w=700&c=1',
    },
    {
      'carName': 'Perodua Viva Elite',
      '1': 'https://imgcdn.zigwheels.lk/large/gallery/interior/17/136/perodua-viva-elite-front-and-rear-seats-together.jpg',
      '2':
          'https://imgcdn.zigwheels.lk/large/gallery/interior/17/136/perodua-viva-elite-dashboard-view.jpg',
      '3':
          'https://img.carswp.com/perodua/viva/photos_perodua_viva_2009_1.jpg',
    },
    {
      'carName': 'Mazda Axela',
      '1': 'https://www.batfa.com/photo-newcar-axelahybrid-interior.files/AxelaHybrid-interior.jpg',
      '2':
          'https://www.mazda.com.au/49a984/globalassets/settings/vehicle-assets/mazda3/2023-05-ipm---bt2/ext360/hatch/01.-g20-pure/25d-snowflake-white/mazv1684_mazda3_g20_pure_hatch_auto_snowflake_white_pearl_bjgsaae_980x452_0022.png',
      '3':
          'https://s1.cdn.autoevolution.com/images/gallery/MAZDA-3---Axela-Hatchback-294_27.jpg',
    },
    {
      'carName': 'Toyota Allion',
      '1': 'https://sbimotor.com/uploads/car/images/45841/3400132_big_2efe38c2.jpg',
      '2':
          'https://www.batfa.com/photo-newcar-axelahybrid-interior.files/AxelaHybrid-interior.jpg',
      '3':
          'https://www.autocourt.net.nz/Motorcentral/VehicleData/AUT-a4d91dac-b9d5-46f5-bb69-3b25e5ab7170-19.jpg',
    },
    {
      'carName': 'Honda Fit',
      '1': 'https://cars.usnews.com/static/images/Auto/custom/13585/2018_Honda_Fit_1.jpg',
      '2':
          'https://cdn.dlron.us/static/dealer-16496/2018-honda-fit-interior-1024x507.jpg',
      '3':
          'https://cars.usnews.com/static/images/Auto/izmo/i159423547/2020_honda_fit_rearview.jpg',
    }
  ];

  int i = 0;
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    // Find the map that matches the carName
    Map<String, String>? selectedCarMap;
    for (var i = 0; i < images.length; i++) {
      if (widget.carName == images[i]['carName']) {
        selectedCarMap = images[i];
        break;
      }
    }

    // If the car is found, extract the image URLs for the keys '1', '2', and '3'
    final imageUrls = selectedCarMap?.entries
            .where((entry) =>
                entry.key == '1' || entry.key == '2' || entry.key == '3')
            .map((entry) => entry.value as String)
            .toList() ??
        [];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        title: const Text('Book A Vehicle Details',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 244, 168, 54),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _vehicleDataFuture,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Vehicle not found'));
          }

          var vehicleData = snapshot.data!.data() as Map<String, dynamic>;
          String pickupDate = vehicleData['from'] ?? 'Unknown';
          String returnsto = vehicleData['to'] ?? 'Unknown';
          String fromTime = vehicleData['fromTime'] ?? 'Unknown';
          String toTime = vehicleData['toTime'] ?? 'Unknown';

          int dayDifferenceCal(String pickupDate, String returnsto){
            DateTime startDate = DateTime.parse(pickupDate);
            DateTime endDate = DateTime.parse(returnsto);
            return endDate.difference(startDate).inDays;
          }
          int numberOfDays = dayDifferenceCal(pickupDate, returnsto);
          int tripCost = numberOfDays * widget.carRentPrice;
          int totalRentPrice = tripCost + 1000;

          return Padding(
            padding: const EdgeInsets.all(17.0),
            child: ListView(
              children: [
                Text(
                  widget.carName,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 114, 167),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          activePage = value;
                        });
                      },
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageUrls[index],
                                height: 200,
                                fit: BoxFit.cover,
                              )),
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130.0),
                  child: SizedBox(
                    height: 35,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: activePage == index
                                      ? Color.fromARGB(255, 244, 168, 54)
                                      : Colors.grey,
                                ),
                                height: 15,
                                width: 15,
                              ));
                        }),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Rs. " + widget.carRentPrice.toString(),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "/Day",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
          
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 244, 168, 54),
                      ),
                      child: Row(
                        children: [
                          Text(
                            widget.carKm,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                          Text(
                            "KM",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Daily Mileage Limit",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
          
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 244, 168, 54),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "500 ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                          Text(
                            "LKR",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Extra Mileage Charge (per km)",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
          
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 244, 168, 54),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "1 ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                          Text(
                            "Day(s)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Minimum rental period",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
          
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 244, 168, 54),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "20 ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                          Text(
                            "Day(s)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Maximum rental period",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
          
                //pickup and return dtaes and times
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pickup",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "$pickupDate",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 20,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "$fromTime",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Return",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "$returnsto",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 20,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "$toTime",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
          
                SizedBox(
                  height: 20,
                ),
          
                Container(
                  padding: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 169, 235, 171))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trip cost:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          Text(
                            "Rs. $tripCost.00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Handling fee:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          Text(
                            "Rs. 1000.00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rental cost:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          Text(
                            "Rs. $totalRentPrice.00",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
          
                //request button
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 30, right: 30),
                        backgroundColor: const Color.fromARGB(255, 244, 168, 54),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckOut(
                                    price: totalRentPrice,
                                    origin: 'vehicle',
                                  )));
                    },
                    child: Text(
                      "Request Vehicle",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

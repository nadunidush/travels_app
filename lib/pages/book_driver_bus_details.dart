import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travels_app/pages/checkout.dart';

class BookDriverBusDetails extends StatefulWidget {
  String carName;
  int carRentPrice;
  String carKm;
  String docId;
  BookDriverBusDetails(
      {super.key,
      required this.carName,
      required this.carRentPrice,
      required this.carKm,
      required this.docId});

  @override
  State<BookDriverBusDetails> createState() => _BookDriverBusDetailsState();
}

class _BookDriverBusDetailsState extends State<BookDriverBusDetails> {
  late Future<DocumentSnapshot> _vehicleDataFuture;

  @override
  void initState() {
    super.initState();
    _vehicleDataFuture = FirebaseFirestore.instance
        .collection('searchDriverWithVehicle')
        .doc(widget.docId)
        .get();
  }
  List<Map<String, String>> images = [
    {
      'carName': '(A/C)Bus Coaster Rosa',
      'carDriverName':'Kasun Nanayakara',
      'carDriverImg':'https://as2.ftcdn.net/v2/jpg/04/28/14/89/1000_F_428148933_dd2iAYezhUhYl0rECNASeKjjmTKbk4ED.jpg',
      'carDriverDescription':'Mr. Kasun Nanayakara, a seasoned bus driver with a decade of experience, is your go-to choice for seamless and enjoyable group tours in Sri Lanka. With his in-depth knowledge of local routes and attractions, combined with excellent English communication skills, he ensures a memorable experience for all passengers.',
      'carDriverLanguage':'English, Germen',
      'carDriverEmail':'kasun82@gmail.com',
      'carDriverPhone':'0754123457',
      '1':
          'https://assets.mitsubishi-fuso.com/fusoassets/2019/12/Carousel_MB_RosaInterior.jpg',
      '2':
          'https://sbimotor.com/uploads/car/images/359363/e56a0667.jpg',
      '3':
          'https://www.dubicars.com/images/f86839/w_1300x760/talib-al-jabry/74f5b530-1f0b-414b-aaa8-65b2f20f27d7.jpg',
    },
    {
      'carName': 'Box Coaster Super Luxury',
      'carDriverName':'Dilshan Perera',
      'carDriverImg':'https://www.shutterstock.com/shutterstock/photos/377150785/display_1500/stock-photo-transport-tourism-road-trip-and-people-concept-happy-driver-driving-intercity-bus-and-snowing-377150785.jpg',
      'carDriverDescription':'Mr. Dilshan Perera, a seasoned bus driver with an impressive 15-year track record, is your ultimate choice for a smooth and enjoyable group tour in Sri Lanka. His fluent English skills and extensive knowledge of the island make him the ideal guide for an unforgettable journey.',
      'carDriverLanguage':'English',
      'carDriverEmail':'dilshan87@gmailcom',
      'carDriverPhone':'0714287392',
      '1': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8t6yVEp3SJk5SybCwO-001slF4LHroI_bAg&s',
      '2':
          'https://www.dubicars.com/images/fbe8c2/w_1300x760/alpha-motors-fze/50e766a8-ac30-46e7-b0a9-aca881d8f0e8.jpg',
      '3':
          'https://gsat.jp/wp-content/uploads/2024/02/2023-TOYOTA-COASTER-4.0L-2229-SEATS-COOLING-BOX10-scaled.jpg',
    },
    {
      'carName': '50 Seater Under Luggage',
      'carDriverName':'Francis jerad',
      'carDriverImg':'https://previews.123rf.com/images/vadimgozhda/vadimgozhda1810/vadimgozhda181005659/111177435-smiling-man-driving-tour-bus-professional-driver-young-happy-man-wearing-white-shirt-and-black-tie.jpg',
      'carDriverDescription':'Mr. Francis Jerad, with a decade of experience behind the wheel, is your expert choice for group tours in Sri Lanka. We specialize in crafting unforgettable group itineraries and providing English-speaking bus drivers with exceptional local knowledge, ensuring a seamless and enjoyable travel experience for all passengers.',
      'carDriverLanguage':'English',
      'carDriverEmail':'Francis@gmail.com',
      'carDriverPhone':'0778612643',
      '1': 'https://luxurybus.lk/wp-content/uploads/2014/12/50-Seater-Inside-2.jpg',
      '2':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmdV_EJbmv861aDQ8JPzsWlbnxpnCGsBFkmw&s',
      '3':
          'https://thumbs.dreamstime.com/b/back-view-inside-bus-seats-monitor-behind-passenger-seat-luggage-compartment-public-transportation-280375680.jpg',
    },
    {
      'carName': '45 Seats Luxury Bus',
      'carDriverName':'Madushan Sathsara',
      'carDriverImg':'https://static1.tamilmurasu.com.sg/s3fs-public/articles/2023/11/24/Bus20Captain20Prasad2C20Photo20credits20to20Anusha20Selvamani.jpg',
      'carDriverDescription':'Mr. Madushan Sathsara, a seasoned bus driver with two decades of experience, offers exceptional group tours of Sri Lanka. As the founder of our company, he brings a wealth of knowledge and ensures a smooth and enjoyable journey for all passengers.',
      'carDriverLanguage':'English, Sinhala',
      'carDriverEmail':'madushan@gmailcom',
      'carDriverPhone':'0785612345',
      '1': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlX-BJZHswk2qs1ZMsQ7lDDI1fv7H_lN0pcQ&s',
      '2':
          'https://www.nefelibatatravels.com/wp-content/uploads/2018/11/45-seater-bus.jpg',
      '3':
          'https://s.alicdn.com/@sc04/kf/H302162daede24c83ab7a99789f4af48a5.jpg_720x720q50.jpg',
    },
    {
      'carName': 'VIP Luxury Bus',
      'carDriverName':'Pinthushehan Fernando',
      'carDriverImg':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToonwNT4zbwCyq-k-qAzXexPn6URz3gT4BxQ&s',
      'carDriverDescription':'Mr. Pinthushehan Fernando, a seasoned bus driver with over a decade of experience, offers a unique blend of transportation and cultural immersion. His deep knowledge of Sri Lankan culture and history, combined with his expertise in navigating the island, ensures an enriching and memorable group tour experience.',
      'carDriverLanguage':'English',
      'carDriverEmail':'pinthushehan@gmail.com',
      'carDriverPhone':'07862318914',
      '1': 'https://thumbs.dreamstime.com/b/luxury-bus-interior-comfortable-seats-image-luxury-bus-interior-rows-comfortable-seats-toilet-inside-124085134.jpg',
      '2':
          'https://lh3.googleusercontent.com/proxy/cp4epZobM4Z2nRgZLWoPihXxZLKuDqkEMebU7nFNIBhdvEBIKPU8vClBlHuysPbP4xbl_fyXK1JTnN49vy9di9k0PLaE4tlcZ0PK1TSZWuG_tjj9myK2UQ',
      '3':
          'https://d10j3mvrs1suex.cloudfront.net/s:bzglfiles/u/25050/cd2b7a165fb9f0b275e76f6a669bd54613f7d219/original/v1-2.jpg/!!/b%3AW1sidCIsMjcwXSxbInNpemUiLCJwaG90byJdXQ%3D%3D/meta%3AeyJzcmNCdWNrZXQiOiJiemdsZmlsZXMifQ%3D%3D.jpg',
    },
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

     
      String? driverName = selectedCarMap?['carDriverName'];
      String? driverImage = selectedCarMap?['carDriverImg'];
      String? driverDescription = selectedCarMap?['carDriverDescription'];
      String? VehicleType  = selectedCarMap?['carName'];
      String? driverLanguages  = selectedCarMap?['carDriverLanguage'];
      String? driverEmail  = selectedCarMap?['carDriverEmail'];
      String? driverPhone  = selectedCarMap?['carDriverPhone'];
      // Use driverName and carModel as needed
 
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

                SizedBox(height: 20,),
                //Driver Information
                Text("Driver Information", style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 114, 167),
                      ),),
                Container(
                  padding: EdgeInsets.all(12),
                  width: 300,
                  //height:  550,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Color.fromARGB(255, 177, 177, 177)),
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(driverName.toString(), style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 10,),
                      //driverimage
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(driverImage.toString(),width: 150,)
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(driverDescription.toString(),style: TextStyle(
                        fontSize: 15,
                        fontWeight:FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.justify,
                      ),

                      SizedBox(height: 26,),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle_outlined, color: Color.fromARGB(255, 1, 114, 167),),
                                SizedBox(width: 5,),
                                Text("Vehicle Type: ", style: TextStyle(fontSize: 16, fontWeight:FontWeight.w400),),
                                Text(VehicleType.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Icon(Icons.circle_outlined, color: Color.fromARGB(255, 1, 114, 167),),
                                SizedBox(width: 5,),
                                Text("Speake Langs: ", style: TextStyle(fontSize: 16, fontWeight:FontWeight.w400),),
                                Text(driverLanguages.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Icon(Icons.circle_outlined, color: Color.fromARGB(255, 1, 114, 167),),
                                SizedBox(width: 5,),
                                Text("Licensed: ", style: TextStyle(fontSize: 16, fontWeight:FontWeight.w400),),
                                Text("Tourist Driver", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Icon(Icons.circle_outlined, color: Color.fromARGB(255, 1, 114, 167),),
                                SizedBox(width: 5,),
                                Text("Email: ", style: TextStyle(fontSize: 16, fontWeight:FontWeight.w400),),
                                Text(driverEmail.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Icon(Icons.circle_outlined, color: Color.fromARGB(255, 1, 114, 167),),
                                SizedBox(width: 5,),
                                Text("Driver Tel: ", style: TextStyle(fontSize: 16, fontWeight:FontWeight.w400),),
                                Text(driverPhone.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travels_app/pages/checkout.dart';

class BookDriverVehicleDetails extends StatefulWidget {
  String carName;
  int carRentPrice;
  String carKm;
  String docId;
  BookDriverVehicleDetails(
      {super.key,
      required this.carName,
      required this.carRentPrice,
      required this.carKm,
      required this.docId});

  @override
  State<BookDriverVehicleDetails> createState() => _BookDriverVehicleDetailsState();
}

class _BookDriverVehicleDetailsState extends State<BookDriverVehicleDetails> {
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
      'carName': 'Mercedes AMG GT',
      'carDriverName':'Kasun Ekanayaka',
      'carDriverImg':'https://i.pinimg.com/736x/00/49/bf/0049bf07f235946231927cfccf349826.jpg',
      'carDriverDescription':'Mr. Kasun Ekanayaka, a seasoned tourist guide lecturer with 8 years of expertise and a decade of experience, leads as your top-choice inbound tour operator in Sri Lanka. Our focus is on curating unforgettable holiday tour packages and providing proficient English-speaking drivers well-versed in local insights.',
      'carDriverLanguage':'English, Hindi',
      'carDriverEmail':'kasun12@gmail.com',
      'carDriverPhone':'0754123457',
      '1':
          'https://hips.hearstapps.com/hmg-prod/images/2024-mercedes-amg-gt-coupe-interior-122-64da40b809fe6.jpg',
      '2':
          'https://hips.hearstapps.com/hmg-prod/images/2024-mercedes-amg-gt-coupe-interior-120-64da40b774dd2.jpg?crop=1xw:1xh;center,top&resize=980:*',
      '3':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7Ym2D7JEH1bYNqVYQ-jiwyV3ZKX8FnPGtTQ&s',
    },
    {
      'carName': 'Toyota Belta',
      'carDriverName':'Tharindu Perera',
      'carDriverImg':'https://cdn.pixabay.com/photo/2022/03/11/06/14/indian-man-7061278_1280.jpg',
      'carDriverDescription':'Mr. Tharindu Perera, a seasoned Mini Coach Driver with an impressive 15-year track record, is your ultimate choice for an exceptional tourist driving experience in Sri Lanka. His fluent English skills and extensive expertise make him the go-to expert for a memorable journey.',
      'carDriverLanguage':'English',
      'carDriverEmail':'tharindu42@gmailcom',
      'carDriverPhone':'0714287392',
      '1': 'https://www.gari.pk/images/new/cars/2022-02/1543_1_27933.jpg',
      '2':
          'https://stimg.cardekho.com/images/carinteriorimages/930x620/Toyota/Belta/8705/1638349818088/dashboard-59.jpg?impolicy=resize&imwidth=420',
      '3':
          'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/ExtraImages/20211119040309_Toyota_Belta_4.jpg&w=700&c=1',
    },
    {
      'carName': 'Perodua Viva Elite',
      'carDriverName':'Supun Dilshan',
      'carDriverImg':'https://catchmydrift.in/cdn/shop/products/brown-munde-exclusive-t-shirt-for-indian-men-printrove-915207.jpg?v=1686867063&width=1946',
      'carDriverDescription':'Mr. Supun Dilshan, with a decade of experience, is your premier inbound tour operator and personal driver in Sri Lanka. We specialize in crafting unforgettable holiday tour packages and providing English-speaking drivers with excellent local knowledge, ensuring an exceptional travel experience.',
      'carDriverLanguage':'English',
      'carDriverEmail':'supunD@gmail.com',
      'carDriverPhone':'0778612643',
      '1': 'https://imgcdn.zigwheels.lk/large/gallery/interior/17/136/perodua-viva-elite-front-and-rear-seats-together.jpg',
      '2':
          'https://imgcdn.zigwheels.lk/large/gallery/interior/17/136/perodua-viva-elite-dashboard-view.jpg',
      '3':
          'https://img.carswp.com/perodua/viva/photos_perodua_viva_2009_1.jpg',
    },
    {
      'carName': 'Mazda Axela',
      'carDriverName':'Pasindu Sathsara',
      'carDriverImg':'https://i.pinimg.com/736x/ab/45/27/ab4527336ab87af4034f5ed5845910d2.jpg',
      'carDriverDescription':'Sri Lanka Driver Guide Mr. Pasindu Sathsara is committed to providing exceptional and immersive tours of the beautiful island of Sri Lanka. As our founder, Mr. Pasindu Sathsara holds a National Guide license and brings two decades of invaluable experience in the tourism industry, making him a seasoned professional in his field.',
      'carDriverLanguage':'English',
      'carDriverEmail':'pasindu@gmailcom',
      'carDriverPhone':'0785612345',
      '1': 'https://www.batfa.com/photo-newcar-axelahybrid-interior.files/AxelaHybrid-interior.jpg',
      '2':
          'https://www.mazda.com.au/49a984/globalassets/settings/vehicle-assets/mazda3/2023-05-ipm---bt2/ext360/hatch/01.-g20-pure/25d-snowflake-white/mazv1684_mazda3_g20_pure_hatch_auto_snowflake_white_pearl_bjgsaae_980x452_0022.png',
      '3':
          'https://s1.cdn.autoevolution.com/images/gallery/MAZDA-3---Axela-Hatchback-294_27.jpg',
    },
    {
      'carName': 'Toyota Allion',
      'carDriverName':'Shehan Fernando',
      'carDriverImg':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToonwNT4zbwCyq-k-qAzXexPn6URz3gT4BxQ&s',
      'carDriverDescription':'Mr. Shehan Fernando, a seasoned professional tour driver with over a decade of experience, takes pride in his profound local knowledge and expertise. Drawing on his in-depth understanding of Sri Lanka\'s culture and history, he ensures an enriching and memorable experience for every traveler.',
      'carDriverLanguage':'English',
      'carDriverEmail':'shehan678@gmail.com',
      'carDriverPhone':'07862318914',
      '1': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFYr3vAJhEZQnWiL3VnaY2RrC0ln9DRYkmcTtIf8dciRRh_V5HwaP4Sdjhmpix8Ga74EY&usqp=CAU',
      '2':
          'https://www.atlasmotorsja.com/wp-content/uploads/2023/10/20230322_111606_9.jpg',
      '3':
          'https://ineaxmotors.com/wp-content/uploads/2023/06/Toyota-Allion-Ineax-Motors-5.jpg',
    },
    {
      'carName': 'Honda Fit',
      'carDriverName':'Tharaka Sadaruwan',
      'carDriverImg':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBvqzyx_zoi6q2c0Gd1XnE7wysD9PGOLe3-A&s',
      'carDriverDescription':'Mr. Tharaka Sadaruwan is dedicated to offering outstanding and immersive tours of the picturesque island of Sri Lanka. With a tourist chauffeur license and more than 10 years of experience in the tourism industry, Mr. Tharaka Sadaruwan is a seasoned professional.',
      'carDriverLanguage':'English',
      'carDriverEmail':'tharaka@gmailcom',
      'carDriverPhone':'07654893919',
      '1': 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Honda_FIT_HYBRID%E3%83%BBF_Comfort_Edition_%28DAA-GP5%29_interior.jpg/1280px-Honda_FIT_HYBRID%E3%83%BBF_Comfort_Edition_%28DAA-GP5%29_interior.jpg',
      '2':
          'https://cdn.dlron.us/static/dealer-16496/2018-honda-fit-interior-1024x507.jpg',
      '3':
          'https://upload.wikimedia.org/wikipedia/commons/1/12/Honda_FIT_HYBRID%E3%83%BBF_Package_%28DAA-GP5%29_rear.jpg',
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
                  height:  550,
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
                        padding: const EdgeInsets.only(left: 28.0),
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
                                Text("Speaking Languages: ", style: TextStyle(fontSize: 16, fontWeight:FontWeight.w400),),
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

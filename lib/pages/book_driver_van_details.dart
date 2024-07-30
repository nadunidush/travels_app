import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travels_app/pages/checkout.dart';

class BookDriverVanDetails extends StatefulWidget {
  String carName;
  int carRentPrice;
  String carKm;
  String docId;
  BookDriverVanDetails(
      {super.key,
      required this.carName,
      required this.carRentPrice,
      required this.carKm,
      required this.docId});

  @override
  State<BookDriverVanDetails> createState() => _BookDriverVanDetailsState();
}

class _BookDriverVanDetailsState extends State<BookDriverVanDetails> {
  late Future<DocumentSnapshot> _vehicleDataFuture;

  @override
  void initState() {
    super.initState();
    _vehicleDataFuture = FirebaseFirestore.instance
        .collection('searchDriverWithVehicle')
        .doc(widget.docId)
        .get();
  }
  List<Map<String, String>> imagesVan = [
    {
      'carName': 'Toyota Hiace ',
      'carDriverName':'Pivithuru Rathnayaka',
      'carDriverImg':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJ4fcOja6DY0XakwUUzw0lP22fAu9Z9wySg&s',
      'carDriverDescription':'Experience the beauty of Sri Lanka with Pivithuru Rathnayaka, your expert guide with over a decade in the tourism industry. Our specialized team crafts unique holiday packages and provides knowledgeable English-speaking drivers to ensure an unforgettable journey.',
      'carDriverLanguage':'English, Germen',
      'carDriverEmail':'pivithuru@gmail.com',
      'carDriverPhone':'0753728457',
      '1':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaGx3wKgVWXKhiR-Taf181YojtvB6AMFBHpg&s',
      '2':
          'https://imgcdn.oto.com/large/gallery/interior/38/801/toyota-hiace-rd-row-seat-710162.jpg',
      '3':
          'https://img.indianautosblog.com/2017/08/Toyota-Hiace-Luxury-at-GIIAS-2017-rear-view.jpg',
    },
    {
      'carName': 'Susuki every buddy',
      'carDriverName':'Samantha Perera',
      'carDriverImg':'https://thumbs.dreamstime.com/b/man-perfect-brilliant-smile-unshaven-face-defocused-background-guy-happy-emotional-expression-outdoors-bearded-man-124640934.jpg',
      'carDriverDescription':'Experience the beauty of Sri Lanka with Samantha Perera, a dedicated mini coach driver with over 15 years of experience. His exceptional knowledge of the island, coupled with his fluency in English, ensures a smooth and informative journey for every tourist.',
      'carDriverLanguage':'English, Sinhala',
      'carDriverEmail':'Samantha76@gmailcom',
      'carDriverPhone':'0719087332',
      '1': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIa1dcGx5-WZMmCVjqwz50agaDdYrxBEUGtA&s',
      '2':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSijq9VLob_Du7S9iluuSxO3kftmUss3mNbiQ&s',
      '3':
          'https://i.pinimg.com/736x/28/20/21/282021a320875475ddcf1e44a2da288e.jpg',
    },
    {
      'carName': 'KDH Van',
      'carDriverName':'Marshala Fernando',
      'carDriverImg':'https://images.unsplash.com/photo-1595152772835-219674b2a8a6?fm=jpg&w=3000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bWVuJTIwc21pbGV8ZW58MHx8MHx8fDA%3D',
      'carDriverDescription':'Discover the heart of Sri Lanka with Marshala Fernando, a seasoned tour operator and driver. With over a decade of experience, we offer personalized itineraries and English-speaking guides who are passionate about sharing the beauty and culture of our island home.',
      'carDriverLanguage':'English',
      'carDriverEmail':'marshala@gmail.com',
      'carDriverPhone':'0775412913',
      '1': 'https://luxurykdhvanhireservice.com/wp-content/uploads/2023/06/WhatsApp-Image-2023-06-23-at-12.14.13-PM-2.jpeg',
      '2':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMsNF5LaeAUPPibX83LXIZ27SBaDGEkSHvwQ&s',
      '3':
          'https://i.pinimg.com/736x/8c/54/f4/8c54f4184a1f6eb83bc15932a4a568ba.jpg',
    },
    {
      'carName': 'Toyota Dolphin Van',
      'carDriverName':'Cristian Sathsara',
      'carDriverImg':'https://img.freepik.com/free-photo/handsome-smiling-young-african-man_171337-9650.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1721692800&semt=sph',
      'carDriverDescription':'Cristian Sathsara offers unforgettable tours of Sri Lanka. As a knowledgeable and experienced guide, he is dedicated to showcasing the island\'s beauty and sharing its rich culture with visitors.',
      'carDriverLanguage':'English, Sinala',
      'carDriverEmail':'cristian@gmailcom',
      'carDriverPhone':'0785649345',
      '1': 'https://riyasewana.com/uploads/toyota-dolphin-long-2219191117475.jpg',
      '2':
          'https://icabs.lk/wp-content/uploads/2018/07/026-06.jpg',
      '3':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3JBfhg5izP3f2tkEHZVfW1XXu5WYq9GBgDw&s',
    },
    {
      'carName': 'Nissan Caravan Super DX',
      'carDriverName':'Chamika Fernando',
      'carDriverImg':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ1XqjepCtAOy8PgXAPo340O-teHdUd2lXlQ&s',
      'carDriverDescription':'With over ten years of driving tourists around Sri Lanka, Chamika Fernando offers more than just transportation. His deep understanding of the local culture and history transforms every journey into an enriching adventure.',
      'carDriverLanguage':'English, Sinala',
      'carDriverEmail':'chamika98@gmail.com',
      'carDriverPhone':'07862318734',
      '1': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRObukPF_pWxrvu6BzdnCrwGUSWAgdkCeEO0Q&s',
      '2':
          'https://www.dubicars.com/images/4d3652/w_1300x760/perfect-motors-fzco/d9d9d215-ccc9-4443-80af-1a9912b9f94e.jpg',
      '3':
          'https://picture1.goo-net.com/070/0702688/J/0702688A30231227W01406.jpg',
    },
    {
      'carName': 'Toyota KDH High Roof ',
      'carDriverName':'Malshan Gunarathna',
      'carDriverImg':'https://us.images.westend61.de/0001223343pw/indian-man-smiling-in-city-BLEF12781.jpg',
      'carDriverDescription':'Malshan Gunarathna, a seasoned driver with over a decade in the tourism industry, invites you to explore the beauty of Sri Lanka. His expert knowledge and dedication ensure an unforgettable journey.',
      'carDriverLanguage':'English, Hindi',
      'carDriverEmail':'malshan@gmailcom',
      'carDriverPhone':'07672893856',
      '1': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN4lqfjjhuX2dM75YiftQlMlY6P42_aeo3bA&s',
      '2':
          'https://luxurykdhvanhireservice.com/wp-content/uploads/2023/06/WhatsApp-Image-2023-06-23-at-12.14.14-PM.jpeg',
      '3':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjKAyqRHPssfTCzH1lOd0zyq341kDU_wi0MA&s',
    }
  ];

  int i = 0;
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    // Find the map that matches the carName
    Map<String, String>? selectedCarMap;
    for (var i = 0; i < imagesVan.length; i++) {
      if (widget.carName == imagesVan[i]['carName']) {
        selectedCarMap = imagesVan[i];
        break;
      }
    }

    // If the car is found, extract the image URLs for the keys '1', '2', and '3'
    final imageUrlsVan = selectedCarMap?.entries
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
                      itemCount: imageUrlsVan.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageUrlsVan[index],
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
                        itemCount: imageUrlsVan.length,
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
                        padding: const EdgeInsets.only(left: 12.0),
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

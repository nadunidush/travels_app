import 'package:flutter/material.dart';
import 'package:travels_app/pages/book_vehicle_details.dart';

class OnlyCarCard extends StatelessWidget {
  String carImage;
  String carName;
  String carLogo;
  int carRentPrice;
  String carKm;
  String docId;

  OnlyCarCard({super.key, required this.carImage, required this.carName, required this.carLogo, required this.carRentPrice, required this.carKm, required this.docId});

  @override
  Widget build(BuildContext context) {
    //carCard
    return Column(
      children: [
        Center(
          child: Container(
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600, spreadRadius: 1, blurRadius: 7),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.network(
                      "$carImage",
                      width: MediaQuery.of(context).size.width,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "$carName",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            "$carLogo",
                            width: 40,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 156,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 176, 214, 132),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: Text(
                              "Rs. $carRentPrice",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "/Day",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                        ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 126,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 228, 228, 228),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "$carKm",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                          Text(
                            "km/Day",
                            style:
                                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
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
                              builder: (context) => BookVehicleDetails(
                                carName: carName,
                                carRentPrice: carRentPrice,
                                carKm: carKm,
                                docId: docId ,
                              )));
                    },
                    child: Text(
                      "BOOK NOW",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 231, 231),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Available",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 91, 149, 25)),
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        color: const Color.fromARGB(255, 91, 149, 25),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}

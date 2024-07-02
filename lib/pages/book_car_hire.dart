import 'package:flutter/material.dart';
import 'package:travels_app/pages/book_vehicle_details.dart';

class BookCarHire extends StatelessWidget {
  const BookCarHire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30
        ),
        title: const Text('Book A vehicle', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
          color: Colors.white
        )),
        backgroundColor: const Color.fromARGB(255, 244, 168, 54),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Car Hire",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,),)),

              SizedBox(height: 20,),
              //first car hire
              Center(
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 1,
                        blurRadius: 10
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        child: Image.network("https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?cs=srgb&dl=pexels-mikebirdy-3729464.jpg&fm=jpg",width: MediaQuery.of(context).size.width,)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text("Mercedes AMG GT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Mercedes-Logo.svg/2048px-Mercedes-Logo.svg.png",width: 40,)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          SizedBox(width: 12,),
                          Container(
                            width: 146,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 176, 214, 132),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 7.0),
                                  child: Text("Rs. 8000.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ),
                                Text("/Day",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                              ]
                              ),
                          ),
                        SizedBox(width: 10,),
                          Container(
                            width: 126,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 228, 228, 228),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text("100",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red),),
                                ),
                                Text("km/Day",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              ]
                              ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 12,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Icon(Icons.star_border_outlined,color: Colors.black,),
                        ],
                      ),
                
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left:12.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                              backgroundColor: const Color.fromARGB(255, 244, 168, 54),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => BookVehicleDetails()));
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
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 232, 231, 231),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Available",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 91, 149, 25)),),
                            Icon(Icons.check_circle_outline,color: const Color.fromARGB(255, 91, 149, 25),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25,),
            ],
          ),
        ),
      )
    );
  }
}
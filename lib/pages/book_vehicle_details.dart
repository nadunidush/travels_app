import 'package:flutter/material.dart';

class BookVehicleDetails extends StatefulWidget {
  const BookVehicleDetails({super.key});

  @override
  State<BookVehicleDetails> createState() => _BookVehicleDetailsState();
}

class _BookVehicleDetailsState extends State<BookVehicleDetails> {
  List<String> images = [
    "https://hips.hearstapps.com/hmg-prod/images/2024-mercedes-amg-gt-coupe-interior-122-64da40b809fe6.jpg",
    "https://hips.hearstapps.com/hmg-prod/images/2024-mercedes-amg-gt-coupe-interior-120-64da40b774dd2.jpg?crop=1xw:1xh;center,top&resize=980:*",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7Ym2D7JEH1bYNqVYQ-jiwyV3ZKX8FnPGtTQ&s",
  ];

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: ListView(
          children: [
            Text(
              "Mercedes AMG GT",
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
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            images[index],
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
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: activePage == index ? Color.fromARGB(255, 244, 168, 54):Colors.grey,
                            ),
                            height: 15,
                            width: 15,
                          ));
                    }),
              ),
            ),
            Row(
              children: [
                Text("Rs. 12000",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                Text("/Day",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w500),),
              ],
            ),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 244, 168, 54),
                  ),
                  child: Row(
                    children: [
                      Text("100 ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),
                      Text("KM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Text("Daily Mileage Limit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 244, 168, 54),
                  ),
                  child: Row(
                    children: [
                      Text("500 ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),
                      Text("LKR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Text("Extra Mileage Charge (per km)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 244, 168, 54),
                  ),
                  child: Row(
                    children: [
                      Text("1 ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),
                      Text("Day(s)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Text("Minimum rental period",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 244, 168, 54),
                  ),
                  child: Row(
                    children: [
                      Text("20 ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),
                      Text("Day(s)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Text("Maximum rental period",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              ],
            ),

            //pickup and return dtaes and times
            SizedBox(height:40,),
            Row(
              children: [
                Text("Pickup",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(width: 25,),
                Text("6/26/2024",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Icon(Icons.calendar_month_rounded,size: 20,),
                SizedBox(width: 25,),
                Text("8:00 AM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("Return",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(width: 25,),
                Text("7/10/2024",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Icon(Icons.calendar_month_rounded,size: 20,),
                SizedBox(width: 25,),
                Text("8:00 PM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),

            SizedBox(height: 40,),
            Text("Owner's details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Color.fromARGB(255, 1, 114, 167)),),
            Row(
              children: [
                Text("Email:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                SizedBox(width: 40,),
                Text("Sadun@gmail.com",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17),),
              ],
            ),

            Row(
              children: [
                Text("Phone Number:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(width: 40,),
                Text("07764536789",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

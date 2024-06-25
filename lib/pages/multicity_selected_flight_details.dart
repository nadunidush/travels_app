import 'package:flutter/material.dart';
import 'package:travels_app/pages/checkout.dart';

class MulticitySelectedFlightDetails extends StatelessWidget {
  final List<Map<String, dynamic>> selectedFlights;
  const MulticitySelectedFlightDetails({super.key,required this.selectedFlights});

  @override
  Widget build(BuildContext context) {
    int totalPrice = selectedFlights.fold(0, (sum, flight) => sum + flight['price'] as int);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 168, 54),
        iconTheme: IconThemeData(
          color: Colors.white,
          weight: 34,
          size: 30,
        ),
        title: Text("Selected Flights",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedFlights.length,
              itemBuilder: (context, index) {
                var flight = selectedFlights[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:  Color.fromARGB(255, 152, 217, 240),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(flight['airlineFlightName'],style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${flight['flyingFrom']}",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 117, 70, 70)
                              ),),
                              Icon(Icons.flight_takeoff_rounded,size: 40,color: const Color.fromARGB(255, 48, 91, 49),),
                              Text("${flight['flyingTo']}",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 117, 70, 70)
                              ),),
                            ],
                          ),
                
                          SizedBox(height: 7,),
                
                          Text("${flight['selectDate']}",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),),
                          Text("${flight['hours']}",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          )),
                          SizedBox(height: 7,),
                          Text("\$${flight['price']}",style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Colors.purple
                          )),
                          
                        ],
                      ),
                    ),
                  ),
                
                  
                );
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                  left: 110, right: 110, top: 20, bottom: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: const Color.fromARGB(255, 244, 168, 54),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckOut(
                    price:  totalPrice,
                  )));
            },
            child: Text(
              "Checkout",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            )),

            SizedBox(height: 10,),
        ],
      ),
    );
  }
}
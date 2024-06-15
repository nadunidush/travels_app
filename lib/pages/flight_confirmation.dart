import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlightConfirmation extends StatelessWidget {
  const FlightConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 168, 54),
        iconTheme: IconThemeData(
          color: Colors.white,
          weight: 34,
          size: 30,
        ),
        title: Text(
          'Confirmation',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 189, 221, 247),
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    "https://t3.ftcdn.net/jpg/05/66/60/32/360_F_566603211_eQVWq7TQfzJ1osI8AmwvifZ4WVFOXeRn.jpg",
                    width: 120,
                  )),

              Text(
                "Done",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Center(
                  child: Text(
                "Your ticket purchase\nsuccessfully completed!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 124, 116, 116)),
              )),

              //image of flight ticket
              Image.asset(
                "assets/flightTicket1.png",
                width: 300,
              ),

              //Download the ticket
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                      left: 80, right: 80, top: 20, bottom: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: const Color.fromARGB(255, 244, 168, 54),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FlightConfirmation()));
                },
                child: Text(
                  "Download Ticket",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),

              //Print the ticket
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                      left: 100, right: 100, top: 20, bottom: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FlightConfirmation()));
                },
                child: Text(
                  "Print Ticket",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),),

                
            ],
          ),
        ),
      ),
    );
  }
}

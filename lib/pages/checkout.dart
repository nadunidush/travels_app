import 'package:flutter/material.dart';
import 'package:travels_app/pages/flight_confirmation.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

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
        title: Text('Checkout',style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 189, 221, 247),
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
        ),

        child: Column(
          children: [
            SizedBox(height: 5,),

            //select the card to checkouts
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.only(top: 6,bottom: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),),
                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmf5rQoOt87qU25VDboIWw9KtxP0rfs6XSqw&s",width: 50,)
                  ),
                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgc9xW_t712-TgFMwJxWxmgiKfTiPjrazjjg&s",width: 50,),
                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLmCw9KwTMuJOlqCjSQ8StSY7qg0gMtohnqA&s",width: 50,),
                  ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50),),
                    child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-U8tK4EfgFz0FAX0yYoXfE05yWfq2tqNLQw&s",width: 50,)
                  ),
                ],
              ),
            ),

            //selected card details container
            SizedBox(height: 10,),
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),

              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Card Holder Name",style: TextStyle(
                    color: Color.fromARGB(255, 168, 168, 168)
                  ),),
                  TextField(
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700
                    ),
                    decoration: InputDecoration(
                       focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        )
                       )
                    ),
                  ),

                  SizedBox(height: 40,),

                  Text("Card Number",style: TextStyle(
                    color: Color.fromARGB(255, 168, 168, 168),
                  ),),
                  TextField(
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700
                    ),
                    decoration: InputDecoration(
                       focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        )
                       )
                    ),
                  ),

                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expire Date",style:TextStyle(
                            color:Color.fromARGB(255, 168, 168, 168),
                          )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: TextField(
                              style: TextStyle(
                              fontSize: 19,
                                fontWeight: FontWeight.w700
                              ),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey
                                  )
                                )
                              ),
                            ),
                          )
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CVV",style:TextStyle(
                            color:Color.fromARGB(255, 168, 168, 168),
                          )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: TextField(
                              style: TextStyle(
                              fontSize: 19,
                                fontWeight: FontWeight.w700
                              ),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey
                                  )
                                )
                              ),
                            ),
                          )
                        ],
                      ),                      
                    ],
                  )
                ],
              ) ,
            ),

            //price of the ticket and the tax pays
            SizedBox(height: 10,),
            Container(
              height: 167,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ticket price",style:TextStyle(
                            color:Color.fromARGB(255, 168, 168, 168),
                      )),
                      Text("\$730",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fare tax",style:TextStyle(
                            color:Color.fromARGB(255, 168, 168, 168),
                      )),
                      Text("\$160",style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),

                  SizedBox(height: 6,),
                  Text("-------------------------------------",style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey
                  ),),
                  SizedBox(height: 6,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount",style:TextStyle(
                            color:const Color.fromARGB(255, 244, 168, 54),
                      )),
                      Text("\$830",style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 244, 168, 54),
                      ),),
                    ],
                  ),
                ],
              ),
            ),

            //Process button
            SizedBox(height: 10,),
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
                    MaterialPageRoute(builder: (context) => FlightConfirmation()));
              },
              child: Text(
                "Procceed",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:travels_app/pages/welcome_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 244, 168, 54),
        actions: [
          Icon(Icons.search,size: 40,color: Colors.white,),
          SizedBox(width: 25,),
          Icon(Icons.menu_rounded,size: 40,color: Colors.white,),
          Padding(padding: EdgeInsets.all(12.0))
        ],
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 244, 168, 54),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.travel_explore_rounded,size: 30,color: Colors.white,),
                        Text("Traveler",style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                        ),),
                      ],
                    ),
                    ],
                  ),
              ),
              
              Positioned(
                top: 180,
                left: 33,
                child: Container(
                  height: 150,
                  width: 330,
                  decoration: BoxDecoration(
                    boxShadow:[BoxShadow(
                      color: Color.fromARGB(255, 239, 239, 239).withOpacity(0.6),
                    )],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.cabin_rounded,color:Colors.purple,size: 30,),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Text("Hotel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(Icons.directions_boat,color:Colors.purple,size: 30,),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Text("Cruises",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                                ),
                              ],
                            )
                          ],
                        ),
                    
                        Spacer(),
                    
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.directions_car_filled_outlined,color:Colors.purple,size: 30,),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Text("Vehicle",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(Icons.flight,color:Colors.purple,size: 30,),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Text("Flights",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

          SizedBox(height: 100,),
          
          Text("Become A Member",style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.w600,
          ),),

          Text("SignIn or create a account",style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.orange[300],
          ),),

          SizedBox(height: 30,),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("assets/homePageTravel.jpg",width: 350,)),
              Positioned(
                top: 170,
                left: 30,
                child: Text("Travel the World",style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),),
              )
            ],
          )
        ],
      ),
    );
  }
}
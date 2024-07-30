import 'package:flutter/material.dart';
import 'package:travels_app/auth/auth_services.dart';
import 'package:travels_app/pages/client_account.dart';
import 'package:travels_app/pages/explore.dart';
import 'package:travels_app/pages/plan_destination_flight.dart';
import 'package:travels_app/pages/plan_destination_vehicle.dart';
import 'package:travels_app/pages/select_signup_signin.dart';
//import 'package:travels_app/pages/trips.dart';
import 'package:travels_app/pages/welcome_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final _auth = AuthService();
  PageController pageController = PageController();
  List<Widget> pages = [Explore(), Account()];

  int selectIndex = 0;
  void onPagechanged(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPagechanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color: selectIndex == 0
                  ? const Color.fromARGB(255, 244, 168, 54)
                  : Color.fromARGB(255, 145, 124, 124),
            ),
            label: "Explore",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.shopping_bag_sharp,
          //     color: selectIndex == 1
          //         ? const Color.fromARGB(255, 244, 168, 54)
          //         : Color.fromARGB(255, 145, 124, 124),
          //   ),
          //   label: "Trips",
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              color: selectIndex == 1
                  ? const Color.fromARGB(255, 244, 168, 54)
                  : Color.fromARGB(255, 145, 124, 124),
            ),
            label: "Acount",
          ),
        ],
        currentIndex: selectIndex,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          height: 1.9,
        ),
        selectedItemColor: const Color.fromARGB(255, 244, 168, 54),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          height: 1.9,
        ),
        unselectedItemColor: Color.fromARGB(255, 145, 124, 124),
      ),
    );
  }
}

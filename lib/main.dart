import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travels_app/pages/home.dart';
import 'package:travels_app/pages/plan_destination_flight.dart';
import 'package:travels_app/pages/select_flight.dart';
import 'package:travels_app/pages/welcome_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // if (kIsWeb){
  //   await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //           apiKey: "AIzaSyCqVTeLZEeAIVj8THlwzlz8lvr6TkrNha4",
  //           authDomain: "travelappflutter-99152.firebaseapp.com",
  //           projectId: "travelappflutter-99152",
  //           storageBucket: "travelappflutter-99152.appspot.com",
  //           messagingSenderId: "462124253309",
  //           appId: "1:462124253309:web:31a12e0cfceae6f82e7114"));
  // } else {

  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

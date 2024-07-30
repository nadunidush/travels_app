import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travels_app/pages/home.dart';
import 'package:travels_app/pages/plan_destination_flight.dart';
import 'package:travels_app/pages/select_flight.dart';
import 'package:travels_app/pages/select_flight_details.dart';
import 'package:travels_app/pages/welcome_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.safetyNet,
  );
  runApp(const MyApp());
}

class IosProvider {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:WelcomePage(),
    );
  }
}

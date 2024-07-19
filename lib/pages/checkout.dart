import 'package:flutter/material.dart';
import 'package:travels_app/pages/flight_confirmation.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:travels_app/pages/vehicle_confirmation.dart';

class CheckOut extends StatelessWidget {
  int price;
  String origin;
  CheckOut({super.key, required this.price, required this.origin});

  final TextEditingController holderNameController = TextEditingController();

  final TextEditingController cardNumberController = TextEditingController();

  final TextEditingController expireDateController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();

  final maskFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  //holdername validate
  String? validateCardHolderName(String value) {
    if (value.isEmpty) {
      return 'Cardholder name cannot be empty';
    }
    return null;
  }

  //cardnumbervalidate
  String? validateCardNumber(String value) {
    final cardNumberRegExp = RegExp(r'^\d{16}$');
    if (!cardNumberRegExp.hasMatch(value)) {
      return 'Card number must be 16 digits';
    }
    return null;
  }

  //expiredate validate
  String? validateExpiryDate(String value) {
    // Ensure the date format is MM/yy
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
      return 'Invalid expiry date format';
    }

    final currentYear = DateTime.now().year %
        100; // Get the last two digits of the current year
    final currentMonth = DateTime.now().month;
    final parts = value.split('/');
    final int month = int.parse(parts[0]);
    final int year = int.parse(parts[1]);

    // Validate month and year
    if (month < 1 || month > 12) {
      return 'Invalid expiry date';
    }

    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return 'Card has expired';
    }

    return null;
  }

  //cvv validate
  String? validateCVV(String value) {
    final cvvRegExp = RegExp(r'^\d{3}$');
    if (!cvvRegExp.hasMatch(value)) {
      return 'CVV must be 3 digits';
    }
    return null;
  }

  // void validateInputs() {
  @override
  Widget build(BuildContext context) {
    int farTax = 160;
    int totalAmount = price + farTax;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 168, 54),
        iconTheme: IconThemeData(
          color: Colors.white,
          weight: 34,
          size: 30,
        ),
        title: Text(
          'Checkout',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 189, 221, 247),
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),

              //select the card to checkouts
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(top: 6, bottom: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                        ),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmf5rQoOt87qU25VDboIWw9KtxP0rfs6XSqw&s",
                          width: 50,
                        )),
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgc9xW_t712-TgFMwJxWxmgiKfTiPjrazjjg&s",
                      width: 50,
                    ),
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLmCw9KwTMuJOlqCjSQ8StSY7qg0gMtohnqA&s",
                      width: 50,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                        ),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-U8tK4EfgFz0FAX0yYoXfE05yWfq2tqNLQw&s",
                          width: 50,
                        )),
                  ],
                ),
              ),

              //selected card details container
              SizedBox(
                height: 10,
              ),
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card Holder Name",
                      style:
                          TextStyle(color: Color.fromARGB(255, 168, 168, 168)),
                    ),
                    TextField(
                      controller: holderNameController,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Card Number",
                      style: TextStyle(
                        color: Color.fromARGB(255, 168, 168, 168),
                      ),
                    ),
                    TextField(
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      //inputFormatters: [maskFormatter],
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Expire Date",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 168, 168, 168),
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: TextField(
                                controller: expireDateController,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w700),
                                decoration: InputDecoration(
                                    hintText: "MM/YY",
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.datetime,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CVV",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 168, 168, 168),
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: TextField(
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w700),
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

              //price of the ticket and the tax pays
              SizedBox(
                height: 10,
              ),
              Container(
                height: 167,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20),
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
                        Text("Ticket price",
                            style: TextStyle(
                              color: Color.fromARGB(255, 168, 168, 168),
                            )),
                        Text(
                          "\$$price",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Fare tax",
                            style: TextStyle(
                              color: Color.fromARGB(255, 168, 168, 168),
                            )),
                        Text(
                          "\$${farTax}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "-------------------------------------",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Amount",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 244, 168, 54),
                            )),
                        Text(
                          "\$${totalAmount}",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 244, 168, 54),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //Process button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 110, right: 110, top: 20, bottom: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color.fromARGB(255, 244, 168, 54),
                  ),
                  onPressed: (){
                    final holderNameError = validateCardHolderName(holderNameController.text);
                    final carNumberError = validateCardNumber(cardNumberController.text);
                    final expireDateError = validateExpiryDate(expireDateController.text);
                    final cvvError = validateCVV(cvvController.text);

                    if (holderNameError == null &&
                        carNumberError == null &&
                        expireDateError == null &&
                        cvvError == null) {
                      if (origin == 'flight') {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => FlightConfirmation()));
                      }else if(origin == 'vehicle'){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VehicleConfirmation()));
                      }

                      final snackBar = SnackBar(content: Text("Card Detail valid:)"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    } else {
                      final snackBar = SnackBar(
                          content: Text(
                              "Errors:\n${holderNameError ?? ''}\n${carNumberError ?? ''}\n${expireDateError ?? ''}\n${cvvError ?? ''}"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    "Processed",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

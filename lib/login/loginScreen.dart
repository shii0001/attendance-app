import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  // ignore: use_full_hex_values_for_flutter_colors
  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: screenHeight / 3,
          width: screenWidth,
          decoration: BoxDecoration(
            color: primary,
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(70)),
          ),
          child: Center(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: screenWidth / 5,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: screenHeight / 15),
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: screenWidth / 18,
              fontFamily: "NexaBold",
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth / 12,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fieldTitle("User ID"),
              customField("Enter your User ID"),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth / 12,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fieldTitle("Password"),
              customField("Enter your password"),
            ],
          ),
        ),
      ],
    ));
  }

  Widget fieldTitle(String title) {
    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Text(title,
            style:
                TextStyle(fontSize: screenWidth / 26, fontFamily: "NexaBold")));
  }

  Widget customField(String hint) {
    return Container(
        width: screenWidth,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(2, 2),
              )
            ]),
        child: Row(
          children: [
            Container(
              width: screenWidth / 6,
              child: Icon(
                Icons.person,
                color: primary,
                size: screenWidth / 15,
              ),
            ),
            Expanded(
              child: TextFormField(
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight / 35,
                    ),
                    border: InputBorder.none,
                    hintText: hint),
              ),
            )
          ],
        ));
  }
}

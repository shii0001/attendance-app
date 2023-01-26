import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;

  // ignore: use_full_hex_values_for_flutter_colors
  Color primary = const Color(0xffeef444c);

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: screenHeight / 15),
            child: Text("Registration",
                style: TextStyle(
                  fontSize: screenWidth / 18,
                  fontFamily: "NexaBold",
                )),
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
                  fieldTitle("Name"),
                  customField("Enter your name", nameController, false),
                  fieldTitle("Email"),
                  customField("Enter your email", emailController, false),
                  fieldTitle("Password"),
                  customField("Enter your password", passwordController, true),
                  fieldTitle("Confirm Password"),
                  customField("Enter your password", passwordController, true),
                ],
              ))
        ],
      ),
    );
  }

  Widget fieldTitle(String title) {
    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Text(title,
            style:
                TextStyle(fontSize: screenWidth / 26, fontFamily: "NexaBold")));
  }

  Widget customField(
      String hint, TextEditingController controller, bool obscure) {
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
              child: Padding(
                padding: EdgeInsets.only(right: screenWidth / 4),
                child: TextFormField(
                  controller: controller,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight / 35,
                    ),
                    border: InputBorder.none,
                    hintText: hint,
                  ),
                  maxLines: 1,
                  obscureText: obscure,
                ),
              ),
            )
          ],
        ));
  }
}

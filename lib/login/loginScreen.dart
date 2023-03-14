import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            isKeyboardVisible
                ? SizedBox(
                    height: screenHeight / 16,
                  )
                : Container(
                    height: screenHeight / 3,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(70)),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: screenHeight / 10),
                          ),
                          Icon(
                            Icons.edit_note_outlined,
                            color: Colors.white,
                            size: screenWidth / 6,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "T0D0",
                              style: TextStyle(
                                fontSize: screenWidth / 18,
                                fontFamily: "NexaBold",
                              ),
                            ),
                          ),
                        ]),
                  ),
            Container(
              margin: EdgeInsets.only(top: screenHeight / 18),
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
                  customField("Enter your User ID", idController, false),
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
                  customField("Enter your password", passController, true),
                  Row(children: [
                    GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        String id = idController.text.trim();
                        String password = passController.text.trim();
                        QuerySnapshot snap = await FirebaseFirestore.instance
                            .collection("User")
                            .where('id', isEqualTo: id)
                            .get();
                        print(snap.docs[0]['id']);

                        if (id.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("User ID is still empty!"),
                          ));
                        } else if (password.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Password is still empty!"),
                          ));
                        } else {
                          QuerySnapshot snap = await FirebaseFirestore.instance
                              .collection("User")
                              .where("id", isEqualTo: id)
                              .get();

                          try {
                            if (password == snap.docs[0]['password']) {
                              print("continue");
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Incorrect password!"),
                            ));
                          }
                        }
                      },
                      child: Container(
                        height: 50,
                        width: screenWidth / 2.5,
                        margin: EdgeInsets.only(top: screenHeight / 40),
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35))),
                        child: Center(
                            child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontFamily: "NexaBold",
                            fontSize: screenWidth / 32,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {},
                      child: Container(
                        height: 50,
                        width: screenWidth / 2.5,
                        margin: EdgeInsets.only(
                            top: screenHeight / 40, left: screenWidth / 32),
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35))),
                        child: Center(
                            child: Text(
                          "REGISTER NOW",
                          style: TextStyle(
                            fontFamily: "NexaBold",
                            fontSize: screenWidth / 32,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        )),
                      ),
                    ),
                  ]),
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
            SizedBox(
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

import 'package:chat_app/screens/landing_page.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/utils/app_essentials.dart';
import 'package:chat_app/utils/text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final appBar = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final deviceSise = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        key: appBar,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  MyColors.primarySwatch,
                  MyColors.accentColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              height: deviceSise.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign up",
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(color: MyColors.altTextColor),
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CustomTextFormField(
                            hintText: "User name",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                          ),
                          SizedBox(height: 15),
                          CustomTextFormField(
                            hintText: "Phone Number",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                          ),
                          SizedBox(height: 15),
                          CustomTextFormField(
                            hintText: "Age",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                          ),
                          SizedBox(height: 15),
                          CustomTextFormField(
                            hintText: "Password",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                          ),
                          SizedBox(height: 15),
                          CustomTextFormField(
                            hintText: "Confirm password",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Spacer(),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LandingPage.routeName);
                      },
                      color: MyColors.primarySwatch[200],
                      child: Text(
                        "Sign up",
                        style: Theme.of(context).textTheme.body1.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text("Sign in"),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Loginscreen.routeName);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:chat_app/screens/landing_page.dart';
import 'package:chat_app/screens/register.dart';
import 'package:chat_app/utils/app_essentials.dart';
import 'package:chat_app/utils/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Loginscreen extends StatelessWidget {
  static const routeName = "/login";
  @override
  Widget build(BuildContext context) {
    final deviceSise = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              height: deviceSise.height - MediaQuery.of(context).padding.top,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.solidCommentAlt,
                          size: 40,
                          color: MyColors.altTextColor,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Get Connected",
                          style: Theme.of(context).textTheme.headline,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CustomTextFormField(
                            hintText: "Login",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                          ),
                          SizedBox(height: 15),
                          CustomTextFormField(
                            hintText: "Password",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Text("Forget password?"),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LandingPage.routeName);
                          },
                          color: MyColors.primarySwatch[200],
                          child: Text(
                            "Sign in",
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(
                        "Sign up",
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
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

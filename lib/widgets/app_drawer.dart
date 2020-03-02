import 'package:chat_app/screens/about_application.dart';
import 'package:chat_app/screens/blocked_list.dart';
import 'package:chat_app/screens/edit_profile.dart';
import 'package:chat_app/screens/landing_page.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/utils/app_essentials.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTIle(
        {IconData icon,
        String title,
        bool showTrailing = false,
        bool showIcon = true,
        Function onTap}) {
      return InkWell(
        onTap: onTap,
        child: ListTile(
          leading: showIcon
              ? FaIcon(
                  icon,
                  color: Colors.black,
                )
              : null,
          title: Text(
            title,
            style:
                Theme.of(context).textTheme.body1.copyWith(color: Colors.black),
          ),
          trailing:
              showTrailing ? Switch(value: false, onChanged: (value) {}) : null,
        ),
      );
    }

    return Drawer(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("public/images/profile.jpeg"),
                    ),
                    Spacer(),
                    Text(
                      "Olushola Benedict",
                      style: Theme.of(context).textTheme.body1.copyWith(
                          color: MyColors.altTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                          child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    buildListTIle(
                        icon: FontAwesomeIcons.solidCommentAlt,
                        title: "Home",
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LandingPage.routeName);
                        }),
                    buildListTIle(
                        icon: FontAwesomeIcons.user,
                        title: "Profile",
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(EditProfile.routeName);
                        }),
                    buildListTIle(
                        icon: FontAwesomeIcons.ban,
                        title: "Blocked users",
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(BlockedList.routeName);
                        }),
                    buildListTIle(
                        icon: FontAwesomeIcons.shieldAlt,
                        title: "Privacy and Security"),
                    buildListTIle(
                        icon: FontAwesomeIcons.infoCircle,
                        title: "About Application",
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AboutApplication.routeName);
                        }),
                    buildListTIle(icon: FontAwesomeIcons.question, title: "Help"),
                    buildListTIle(
                        icon: FontAwesomeIcons.userSecret,
                        title: "Incognito mode",
                        showTrailing: true),
                    // buildListTIle(
                    //     icon: FontAwesomeIcons.moon,
                    //     title: "Night mode",
                    //     showTrailing: true, onTap: () {
                    //     }),
                    buildListTIle(
                        icon: FontAwesomeIcons.signOutAlt,
                        title: "Log out",
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Loginscreen.routeName);
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      
    );
  }
}

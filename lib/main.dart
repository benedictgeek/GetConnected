import 'package:chat_app/screens/about_application.dart';
import 'package:chat_app/screens/app_settings.dart';
import 'package:chat_app/screens/audo_call.dart';
import 'package:chat_app/screens/blocked_list.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/debug_screen.dart';
import 'package:chat_app/screens/edit_profile.dart';
import 'package:chat_app/screens/landing_page.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/register.dart';
import 'package:chat_app/screens/user_profile.dart';
import 'package:chat_app/screens/video_call.dart';
import 'package:chat_app/utils/app_essentials.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyColors.primarySwatch,
        accentColor: MyColors.accentColor,
        fontFamily: "Roboto",
        cursorColor: MyColors.body,
        textTheme: Theme.of(context).textTheme.copyWith(
          title: TextStyle(
            fontSize: 18
          ),
          body1: TextStyle(
            fontSize: 16,
            color: MyColors.body
          ),
          body2: TextStyle(
            fontSize: 17,
            color: MyColors.body
          ),
          headline: TextStyle(
            fontFamily: "Lobster",
            fontSize: 22,
            color: MyColors.altTextColor
          )
        )
      ),
      home: Loginscreen(),
      routes: {
        Loginscreen.routeName: (ctx) => Loginscreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        AudioCallScreen.routeName: (ctx) => AudioCallScreen(),
        VideoCallScreen.routeName: (ctx) => VideoCallScreen(),
        AboutApplication.routeName: (ctx) => AboutApplication(),
        LandingPage.routeName: (ctx) => LandingPage(),
        UserProfile.routeName: (ctx) => UserProfile(),
        BlockedList.routeName: (ctx) => BlockedList(),
        ChatScreen.routeName: (ctx) => ChatScreen(),
        AppSettings.routeName: (ctx) => AppSettings(),
        EditProfile.routeName: (ctx) => EditProfile()
      },
    );
  }
}

import 'package:chat_app/utils/app_essentials.dart';
import 'package:chat_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AboutApplication extends StatelessWidget {
  static const routeName = 'about-application';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("About application"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: MyAppDrawer(),
      body: Stack(
        children: <Widget>[
          AppBackground(),
          SafeArea(
              child: SingleChildScrollView(
                              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            height: deviceSize.height - MediaQuery.of(context).padding.top,
            child: Column(
                children: <Widget>[
                  SizedBox(height: 100),
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.chat,
                            size: 40,
                            color: MyColors.altTextColor,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Get Connected",
                            style: Theme.of(context).textTheme.headline,
                          )
                        ],
                      )),
                  SizedBox(height: 30),
                  Text("Version 1.0", style: Theme.of(context).textTheme.body1.copyWith(
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 50),
                  Text("Licence"),
                  SizedBox(height: 25),
                  Text("Developers"),
                  SizedBox(height: 25),
                  Text("Idea"),
                ],
            ),
          ),
              ))
        ],
      ),
    );
  }
}
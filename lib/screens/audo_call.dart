import 'dart:async';

import 'package:chat_app/utils/app_essentials.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AudioCallScreen extends StatefulWidget {
  static const routeName = "/audio-call";

  @override
  _AudioCallScreenState createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  bool _isFullText = true;
  Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 800), (Timer t) {
      setState(() {
        _isFullText = !_isFullText;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio call"),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Stack(
              children: <Widget>[
                CallBackground(),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SizedBox(height: 25),
                          CircleAvatar(
                            backgroundColor: MyColors.accentColor,
                            backgroundImage: AssetImage(userData["picture"]),
                            radius: 40,
                          ),
                          SizedBox(height: 20),
                          AnimatedDefaultTextStyle(
                            style: _isFullText
                                ? Theme.of(context).textTheme.body1.copyWith(
                                    color: MyColors.altTextColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)
                                : Theme.of(context).textTheme.body1.copyWith(
                                    color: MyColors.altTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                            duration: const Duration(milliseconds: 800),
                            child: Text(
                              "Audio call to ${userData["name"]}",
                            ),
                          ),
                          SizedBox(height:  30,),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: MyColors.primarySwatch[100],
                            child: IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.phoneSlash,
                                size: 25,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                  ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.grey[350],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.volumeUp,
                        size: 20,
                      ),
                      color: Colors.white54,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 60),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.microphoneSlash,
                        size: 20,
                      ),
                      color: Colors.white54,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

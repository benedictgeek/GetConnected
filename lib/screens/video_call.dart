import 'dart:async';
import 'package:chat_app/utils/app_essentials.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoCallScreen extends StatefulWidget {
  static const routeName = "/video-call";

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  static bool _isFullText = true;
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
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("Video call"),
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 25),
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
                            "Video call to ${userData["name"]}",
                          ),
                        ),
                        SizedBox(height: 30),
                        CircleAvatar(
                          backgroundColor: MyColors.accentColor,
                          radius: 150,
                          backgroundImage: AssetImage(userData["picture"]),
                        ),
                        SizedBox(height: 30),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: MyColors.primarySwatch[100],
                          child: IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.videoSlash,
                              size: 26,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.camera,
                        size: 20,
                      ),
                      color: Colors.white54,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 60),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.microphoneSlash,
                        size: 18,
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

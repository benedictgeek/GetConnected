import 'package:chat_app/screens/audo_call.dart';
import 'package:chat_app/screens/landing_page.dart';
import 'package:chat_app/screens/video_call.dart';
import 'package:chat_app/utils/app_essentials.dart';
import 'package:chat_app/utils/text_form_field.dart';
import 'package:chat_app/widgets/receiver_chat_boxes.dart';
import 'package:chat_app/widgets/sender_chat_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = "/chat-screen";
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final safeArea = MediaQuery.of(context).padding;
    final baseHeight = deviceSize.height -
        safeArea.top -
        kToolbarHeight -
        MediaQuery.of(context).viewInsets.bottom;

    final userData = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: ChatScreenAppBar(
        picture: userData["picture"],
        name: userData["name"],
      ),
      body: Stack(children: <Widget>[
        CallBackground(),
        Container(
          height: baseHeight,
          child: Column(
            children: <Widget>[
              Container(
                height: baseHeight - 55,
                padding: EdgeInsets.all(10),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    SenderReplyBox(
                      reapeatedReply: false,
                      text: "Hey there!",
                    ),
                    SenderReplyBox(
                      text: "You stay close to me",
                    ),
                    RecieverReplyBox(
                      reapeatedReply: false,
                      text: "Oh Yeah?",
                    ),
                    SenderReplyBox(
                      reapeatedReply: false,
                      text: "Yeah",
                    ),
                    RecieverReplyBox(
                      reapeatedReply: false,
                      text: "That is cool, would love to meet!",
                    ),
                    RecieverReplyBox(
                      text:
                          "I will be free this weekend, if you dont mind we can hang out",
                    ),
                    SenderReplyBox(
                      reapeatedReply: false,
                      text: "Sure, of course!",
                    ),
                  ],
                ),
              ),
              Container(
                height: 55,
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomTextFormField(
                        icon: IconButton(icon: FaIcon(FontAwesomeIcons.smile, color: Colors.black,), onPressed: () {},),
                        suffixIcon:  IconButton(icon: FaIcon(FontAwesomeIcons.paperclip, color: Colors.black,), onPressed: () {},),
                        contentPadding: EdgeInsets.only(left: 20),
                        borderRadius: 25,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: IconButton(
                        icon: Icon(Icons.send),
                        color: MyColors.altTextColor,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class ChatScreenAppBar extends PreferredSize {
  final String name;
  final String subTitle;
  final String picture;

  ChatScreenAppBar({this.picture, this.subTitle, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                SizedBox(width: 1),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(picture),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.body1.copyWith(
                          color: MyColors.altTextColor,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "last seen at 3.14pm",
                    style: Theme.of(context).textTheme.body1.copyWith(
                          color: MyColors.altTextColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                ],
              ),
          ),
          Expanded(
            child: FittedBox(
                          child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.video,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(VideoCallScreen.routeName,
                            arguments: {"name": name, "picture": picture});
                      }),
                  IconButton(
                    icon: FaIcon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AudioCallScreen.routeName,
                          arguments: {"name": name, "picture": picture});
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

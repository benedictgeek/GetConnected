import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatelessWidget {
  static const routeName = "/user-profile";
  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(userData["name"]),
      ),
      // drawer: MyAppDrawer(),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.shareAlt,
                        size: 30,
                      ),
                      onPressed: () {}),
                  SizedBox(width: 35),
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.heart,
                        size: 30,
                      ),
                      onPressed: () {}),
                  SizedBox(width: 35),
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.userPlus,
                        size: 30,
                      ),
                      onPressed: () {}),
                  SizedBox(width: 35),
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.ban,
                        size: 30,
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            SizedBox(height: 15),
            Align(
              child: CircleAvatar(
                backgroundImage: AssetImage(userData["picture"]),
                radius: 120,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 58, right: 58),
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              "public/images/image${index + 1}.jpeg"),
                          radius: 30,
                        ),
                        SizedBox(width: 10)
                      ],
                    );
                  },
                  itemCount: 8,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: <Widget>[
                Text(
                  "${userData["name"]} ${userData["age"]}",
                  style: Theme.of(context).textTheme.body2.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                )
              ],
            ),
            SizedBox(height: 5),
            Text(
              userData["location"],
              style: Theme.of(context)
                  .textTheme
                  .body2
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            Text(
              userData["occupation"],
              style: Theme.of(context)
                  .textTheme
                  .body2
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            SizedBox(height: 10),
            Container(
              constraints: BoxConstraints(maxHeight: 120, minHeight: 120),
              child: SingleChildScrollView(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ChatScreen.routeName,
                    arguments: {
                      "name": userData["name"],
                      "picture": userData["picture"]
                    },
                  );
                },
                child: Column(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.commentDots,
                      size: 45,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      "Chat with ${userData["name"]}",
                      style: Theme.of(context).textTheme.body2.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

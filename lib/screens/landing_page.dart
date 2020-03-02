import 'dart:math';

import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/user_profile.dart';
import 'package:chat_app/utils/app_essentials.dart';
import 'package:chat_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  static const routeName = '/landing-page';

  final usersData = DummyData.usersData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
          )
        ],
      ),
      drawer: MyAppDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, bottom: 5),
              child: Text(
                "Recommended users",
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.black),
              ),
            ),
            Container(
              height: 110,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0.3,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          UserProfile.routeName,
                          arguments: {
                            "name": usersData[index]["name"],
                            "picture": "public/images/image${index + 1}.jpeg",
                            "age": usersData[index]["age"],
                            "location": usersData[index]["location"],
                            "occupation": usersData[index]["occupation"],
                          },
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                  "public/images/image${index + 1}.jpeg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Flexible(
                              child: Text(
                                "${usersData[index]["age"]}, ${usersData[index]["last_name"]} ${usersData[index]["name"]}",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ChatScreen.routeName, arguments: {
                        "name": usersData[index]["name"],
                        "picture": "public/images/image${index + 1}.jpeg"
                      });
                    },
                    child: Card(
                      elevation: 0.1,
                      child: ListTile(
                        leading: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              UserProfile.routeName,
                              arguments: {
                                "name": usersData[index]["name"],
                                "picture":
                                    "public/images/image${index + 1}.jpeg",
                                "age": usersData[index]["age"],
                                "location": usersData[index]["location"],
                                "occupation": usersData[index]["occupation"],
                              },
                            );
                          },
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(
                                "public/images/image${index + 1}.jpeg"),
                          ),
                        ),
                        title: Row(
                          children: <Widget>[
                            Text(
                              usersData[index]["name"],
                              style: Theme.of(context).textTheme.body2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor:
                                  Random.secure().nextInt(32) % 2 == 0
                                      ? Colors.green
                                      : Colors.grey,
                            )
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                              "${usersData[index]["age"]}, ${usersData[index]["location"]}"),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

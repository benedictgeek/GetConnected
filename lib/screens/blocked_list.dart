import 'package:chat_app/utils/app_essentials.dart';
import 'package:chat_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class BlockedList extends StatelessWidget {
  static const routeName = "/blocked-lists";

  final usersData = DummyData.usersData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${usersData.length} blocked users"),
      ),
      drawer: MyAppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemBuilder: (ctx, index) => Card(
            elevation: 0.1,
            child: Container(
              height: 70,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage("public/images/image${index+1}.jpeg"),
                ),
                title: Text(
                  usersData[index]["name"],
                  style: Theme.of(context).textTheme.body2.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(usersData[index]["location"],),
                ),
                trailing: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Unblock",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
          ),
          itemCount: usersData.length,
        ),
      ),
    );
  }
}

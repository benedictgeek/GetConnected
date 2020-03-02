import 'package:chat_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfile extends StatelessWidget {
  static const routeName = "/edit-profile";
  @override
  Widget build(BuildContext context) {
    Widget buidEditCard({String title}) {
      return Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black, letterSpacing: 0.5),
            ),
            trailing: IconButton(
              icon: FaIcon(FontAwesomeIcons.edit),
              onPressed: () {},
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      drawer: MyAppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 160,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage:
                                AssetImage("public/images/profile.jpeg"),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: FloatingActionButton(
                            child: Icon(Icons.camera),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: 70,
                        margin: EdgeInsets.only(bottom: 20),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return Container(
                              padding: EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: ExactAssetImage(
                                    "public/images/image${index+1}.jpeg"),
                              ),
                            );
                          },
                          itemCount: 10,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Olushola 20",
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
                      "Lagos, Nigeria",
                      style: Theme.of(context).textTheme.body2.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                    Text(
                      "Developer",
                      style: Theme.of(context).textTheme.body2.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Container(
                      constraints:
                          BoxConstraints(maxHeight: 120, minHeight: 120),
                      child: SingleChildScrollView(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries. ",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              buidEditCard(title: "Edit bio"),
              buidEditCard(title: "Change name"),
              buidEditCard(title: "Change location"),
            ],
          ),
        ),
      ),
    );
  }
}

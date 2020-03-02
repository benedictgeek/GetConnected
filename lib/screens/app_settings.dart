import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget {
    static const routeName = "/app-settings"; 

  @override
  Widget build(BuildContext context) {
    Widget buildListTIle(
        {IconData icon,
        String title,
        bool showTrailing = false,
        bool showIcon = true}) {
      return InkWell(
        onTap: () {
          print("${title}");
        },
        child: ListTile(
          leading: showIcon ? Icon(icon, color: Colors.black,) : null,
          title: Text(title, style: Theme.of(context).textTheme.body1.copyWith(
            color: Colors.black
          ),),
          trailing:
              showTrailing ? Switch(value: false, onChanged: (value) {}) : null,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("settings"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              buildListTIle(icon: Icons.cloud_circle, title: "Language"),
              buildListTIle(icon: Icons.person, title: "Profile"),
              buildListTIle(icon: Icons.settings, title: "Chat Settings"),
              buildListTIle(
                  icon: Icons.security, title: "Privacy and Security"),
              buildListTIle(icon: Icons.info, title: "About Application"),
              buildListTIle(icon: Icons.help, title: "Help"),
              buildListTIle(
                  icon: Icons.blur_circular,
                  title: "Incognito mode",
                  showTrailing: true),
              buildListTIle(
                  icon: Icons.blur_circular,
                  title: "Night mode",
                  showTrailing: true),
              buildListTIle(showIcon: false, title: "Log out"),
            ],
          ),
        ),
      ),
    );
  }
}

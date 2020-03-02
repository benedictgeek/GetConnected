import 'package:flutter/material.dart';

class DebugScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var reapeatedReply = true;
    var text = "Some text to fill container Some text to fill container Some text to fill container Some text to fill container";
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(top: reapeatedReply == false ? 10 : 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              // margin: EdgeInsets.only(right: reapeatedReply == true ? 12 : 0, bottom: 3),
              margin: EdgeInsets.only(right: 12, bottom: 3),
              constraints: BoxConstraints(
                      maxWidth: deviceSize.width * 0.8, maxHeight: 100)
                  .tighten(),
              decoration: BoxDecoration(
                color: Color(0xFFFFF5C7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: reapeatedReply == true
                        ? Radius.circular(10)
                        : Radius.zero),
              ),
              child: IntrinsicWidth(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        text,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.black),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "8:45 PM",
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(fontSize: 12),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

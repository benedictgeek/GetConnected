import 'package:flutter/material.dart';

class SenderReplyBox extends StatelessWidget {
  final bool reapeatedReply;
  final String text;
  SenderReplyBox({this.reapeatedReply = true, this.text});
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
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
            margin: EdgeInsets.only(
                right: reapeatedReply == true ? 12 : 0, bottom: 3),
            constraints: BoxConstraints(
              maxWidth: deviceSize.width * 0.8,
            ),
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
          if (reapeatedReply == false)
            CustomPaint(
              size: Size(12, 16),
              painter: ReplyStartIndicator(),
            ),
        ],
      ),
    );
  }
}

class ReplyStartIndicator extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint();
    _paint.color = Color(0xFFFFF5C7);
    _paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

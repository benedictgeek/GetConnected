import 'package:flutter/material.dart';

class RecieverReplyBox extends StatelessWidget {
  final bool reapeatedReply;
  final String text;
  RecieverReplyBox({this.reapeatedReply = true, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: !reapeatedReply ? 10 : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (reapeatedReply == false) 
          CustomPaint(
            size: Size(12, 16),
            painter: ReplyStartIndicator(),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8 ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            margin: EdgeInsets.only(left: reapeatedReply ? 12 : 0, bottom: 3,),
            // margin: EdgeInsets.only(left: 12, bottom: 3,),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: reapeatedReply ? Radius.circular(10) : Radius.zero,
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10)
              ),
            ),
            child: IntrinsicWidth(
                          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      text,
                      style:
                          Theme.of(context).textTheme.body1.copyWith(color: Colors.black),
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
          // SizedBox(width: 3,),
          
        ],
      ),
    );
  }
}

class ReplyStartIndicator extends CustomPainter {
  Paint _paint = Paint();
  ReplyStartIndicator() {
    _paint.color = Colors.white;
    _paint.style = PaintingStyle.fill;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Animation Task'),
      ),
      body: MyA1(),
    ),
  ));
}

class MyA1 extends StatefulWidget {
  @override
  _MyA1State createState() => _MyA1State();
}

class _MyA1State extends State<MyA1> with SingleTickerProviderStateMixin {
  var myanicon;
  var animation;

  @override
  void initState() {
    super.initState();
    myanicon = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    print(myanicon);

    animation = CurvedAnimation(
      parent: myanicon,
      curve: FlippedCurve(Curves.bounceIn.flipped),
    )..addListener(() {
        setState(() {
          print(animation.value);
        });
      });
    myanicon.forward(from: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    myanicon.dispose();
  }

  var col = Colors.blue[500];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 15 * animation.value,
        child: GestureDetector(
          onTap: () {
            myanicon.forward(from: 0.3);
            setState(() {
              col = Colors.blue[50];
            });
          },
          onDoubleTap: () {
            myanicon.forward(from: 0.3);
            setState(() {
              col = Colors.blue[500];
            });
          },
          child: Container(
            margin: EdgeInsets.all(0),
            width: animation.value * 200 + 150,
            height: animation.value * 200 + 150,
            color: col,
            child: Center(
              child: Text(
                'Hey There!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 24.0 * animation.value + 8.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

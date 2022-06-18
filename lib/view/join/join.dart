import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Join extends StatefulWidget {
  const Join({Key? key}) : super(key: key);

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {

  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 15),
              height: 130,
              alignment: Alignment.topLeft,
              child: Text(
                'What are you\ninterested in?',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 15),
              height: 40,
              child: Text(
                '10,000 classes',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20
                ),
              ),
            ),
            Wrap(
              
            )
          ],
        ),
      ),
    );
  }
}
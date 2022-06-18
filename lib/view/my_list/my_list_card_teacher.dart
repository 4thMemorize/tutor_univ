import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyListCardT extends StatelessWidget {
  const MyListCardT(
    {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1
          )
        )
      ),
      child: Column(
        children: [
          Container(
            height: 130,
            // color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 10
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 140,
                  height: 110,
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        child: Text(
                          'Class Name',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Text(
                          'Student',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.only(
                          top: 10
                        ),
                        child: Text(
                          '2022.05.13 ~ 2022.07.13',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.4)
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
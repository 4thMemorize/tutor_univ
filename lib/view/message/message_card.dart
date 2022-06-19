import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MessageCard extends StatelessWidget {
  final String type;
  
  const MessageCard(
    {Key? key,
    required this.type
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/message_room');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.3),
              width: 1
            )
          )
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: 10
              ),
              child: SvgPicture.asset(
                'assets/profile.svg',
                color: type == 'teachers'
                  ? Color(0xFF33CCFF)
                  : Color(0xFF33FFCC),
                width: 70,
                height: 70,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(
                      top: 15
                    ),
                    child: Text(
                      type == 'teachers'
                        ? 'ABC'
                        : 'DEF',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    margin: EdgeInsets.only(
                      top: 5
                    ),
                    child: Text(
                      type == 'teachers'
                        ? 'abcabcbacbacbacbabc'
                        : 'defedefedfefdefdefe',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.6)
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
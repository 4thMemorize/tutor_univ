import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/message_controller.dart';

class MessageFactory {
  Widget generate() {
    final MessageController controller = Get.find<MessageController>();
    return ListView.builder(
      itemCount: controller.messageList.length,
      itemBuilder: listBuilder,
    );
  }

  Widget listBuilder(BuildContext context, int idx) {
    final MessageController controller = Get.find<MessageController>();
    print(controller.messageList);
      if(controller.messageList[idx].flag == 'inquiry') {
        return renderI(context, controller.messageList[idx]);
      }
      else { // request
      return renderR(context, controller.messageList[idx]);
      }
  }

  Widget renderI(BuildContext context, Message item) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 8, left: 12, right: 12),
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.693, minHeight: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFF33FFCC)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        item.content!.path
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: Text(
                        '${item.content!.name} class',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xFF888888)
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Color(0xFF333333),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '튜터링 문의 드립니다.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          // 시간
          Text(
            '11:40', //getDateText 메서도 구현 후 6:15am, 어제, 1주 전 등 텍스트
            style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'NanumSquareRound',
                color: Color(0xff91949D)),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
  Widget renderR(BuildContext context, Message item) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 8, left: 12, right: 12),
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.693, minHeight: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF3F3F3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '130,000원 결제해주세요.',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'NanumSquareRound',
                      color: Color(0xff000000)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: 170,
                  height: 1,
                  color: Color(0xFF333333),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/payment');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 8, top: 5),
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFCCCCCC),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text(
                      '결제하기',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          // 시간
          Text(
            '11:47', //getDateText 메서도 구현 후 6:15am, 어제, 1주 전 등 텍스트
            style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'NanumSquareRound',
                color: Color(0xff91949D)),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
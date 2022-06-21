import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/class_controllder.dart';
import 'package:tmp/controllers/message_controller.dart';
import 'package:tmp/view/bottom_nav.dart';
import 'package:tmp/view/message/message_factory.dart';

class MessageRoom extends StatefulWidget {
  const MessageRoom({Key? key}) : super(key: key);

  @override
  State<MessageRoom> createState() => _MessageRoomState();
}

class _MessageRoomState extends State<MessageRoom> {
  final ClassController classController = Get.find<ClassController>();
  final MessageController messageController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavBar(currentTab: Routes.message),
    );
  }

  Widget getBody() {
    double height = Get.height;
    return SafeArea(
      child: GetBuilder<MessageController>(
        builder: (controller) {
          return Center(
            child: Column(
                children: [
                  Container(
                      // padding: EdgeInsets.only(
                      //   top: height * 0.004,
                      //   bottom: height * 0.003,
                      // ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                          // SizedBox(
                          //   width: 60.0,
                          //   child: GetBuilder<MessageRoomController>(builder: (_) {
                          //     return Image.asset(_.messageRoom.info.participants[0].profileImageUrl);
                          //   }),
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: height * 0.003,
                              ),
                              Text(
                                'userName',
                                style: TextStyle(fontSize: 16, fontFamily: 'NotosansKr', fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              Text(
                                'userId',
                                style: TextStyle(fontFamily: 'Notosans', color: Color(0xff91949D)),
                              )
                            ],
                          ),
                        ],
                      )),
                  Expanded(
                    child: MessageFactory().generate()
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: 80,
                    child: Padding(
                      // padding: EdgeInsets.only(
                      //     bottom: MediaQuery.of(context).viewInsets.bottom),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        child: TextField(
                          // controller: searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 40),
                            border: InputBorder.none,
                            hintText: '메시지 작성하기',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          maxLines: 10,
                          onChanged: (text) {
                            // setState(() {
                            //   isTyping = text.length > 0;
                            // });
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                // SvgPicture.asset(
                                //   'assets/message/imageAdd.svg',
                                //   width: 38,
                                // ),
                                // SvgPicture.asset(
                                //   'assets/message/dollar.svg',
                                //   width: 38,
                                // ),
                              ],
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   style: ButtonStyle(
                          //     backgroundColor:
                          //         MaterialStateProperty.resolveWith<Color>((states) {
                          //       // isTyping == true ? Colors.brown : Color(0xFFF3F3F3) ;
                          //       if (isTyping == true) {
                          //         return Color(0xFF49AFCF); //Disabled color
                          //       } else {
                          //         return Color(0xFFF3F3F3); //Regular color
                          //       }
                          //     }),
                          //   ),
                          //   child: Text('전송'),
                          // )
                          InkWell(
                            onTap: () {
                              messageController.messageList.add(Message('request', null));
                              messageController.update();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 27,
                              decoration: BoxDecoration(
                                color: Color(0xFF33FFCC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '전송',
                                style: TextStyle(fontFamily: 'NotoSans', fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xff000000)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
        },
      )
    );
  }
}
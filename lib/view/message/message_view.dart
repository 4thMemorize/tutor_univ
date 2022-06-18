import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tmp/controllers/app_controller.dart';
import 'package:tmp/view/message/message_card.dart';

import '../bottom_nav.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getbody(),
      bottomNavigationBar: BottomNavBar(
        currentTab: Routes.message,
      ),
    );
  }

  Widget getbody() {
    return SafeArea(
      child: Obx(() {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => appController.changeMode(),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05
                        ),
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          color: appController.appMode.value == Mode.Tutee
                        ? Color(0xFF33FFCC)
                        : Color(0xFF33CCFF),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Text(
                            appController.appMode.value.toShortString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Text(
                    appController.appMode.value == Mode.Tutor
                      ? 'Students'
                      : 'Teachers',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800
                      ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    MessageCard(
                      type: appController.appMode.value == Mode.Tutee
                        ? 'teachers'
                        : 'students',
                    ),
                    MessageCard(
                      type: appController.appMode.value == Mode.Tutee
                        ? 'teachers'
                        : 'students',
                    ),
                    MessageCard(
                      type: appController.appMode.value == Mode.Tutee
                        ? 'teachers'
                        : 'students',
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
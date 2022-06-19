import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/app_controller.dart';
import 'package:tmp/controllers/class_controllder.dart';
import 'package:tmp/view/bottom_nav.dart';

class ClassDetail extends StatefulWidget {
  const ClassDetail({Key? key}) : super(key: key);

  @override
  State<ClassDetail> createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {
  final AppController appController = Get.find<AppController>();
  final ClassController classController = Get.find<ClassController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavBar(
        currentTab: Routes.classes,
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: GetBuilder<ClassController>(
        builder: (bcontext) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * (9/16),
                      child: Image.asset(
                        classController.selectedClass!.path,
                        fit: BoxFit.cover,
                      ),
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => appController.changeMode(),
                          child: Obx(() {
                            return Container(
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
                            );
                          })
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding: EdgeInsets.only(
                  left: 20,
                ),
                margin: EdgeInsets.only(
                  top: 20
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black.withOpacity(0.2),
                      width: 1
                    )
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Classsssssss\nName',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Tutor Name',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    desc(),
                    desc(),
                    desc(),
                    desc(),
                    desc(),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        child: Container(
                          // width: 300,
                          height: 60,
                          margin: EdgeInsets.only(
                            left: 80,
                            right: 80,
                            bottom: 60
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF33FFCC)
                          ),
                          child: Text(
                            'Inquiry',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        );
      }),
    );
  }

  Widget desc() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(
              left: 20
            ),
            child: Text(
              'Class description',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(
              left: 20
            ),
            child: Text(
              'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum Routes {classes, myList, message, info}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.currentTab}) : super(key: key);

  final Routes currentTab;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: 46,
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/classes');
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: (MediaQuery.of(context).size.width) / 4,
                      height: 46,
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Container(
                        child: Icon(
                          currentTab == Routes.classes
                            ? Icons.home
                            : Icons.home_outlined,
                          size: 30,
                          color: Colors.black
                          ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/myList');
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: (MediaQuery.of(context).size.width) / 4,
                      height: 46,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: 24,
                        child: Icon(
                          Icons.list_alt_outlined,
                          size: 30,
                          color: Colors.black,
                        )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/message');
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: (MediaQuery.of(context).size.width) / 4,
                      height: 46,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: 24,
                        child: Icon(
                          currentTab == Routes.message
                            ? Icons.message
                            : Icons.message_outlined,
                          size: 30,
                        )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/info');
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      width: (MediaQuery.of(context).size.width) / 4,
                      height: 46,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: 24,
                        child: Icon(
                          currentTab == Routes.info
                          ? Icons.school
                          : Icons.school_outlined,
                          size: 30,
                        )
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
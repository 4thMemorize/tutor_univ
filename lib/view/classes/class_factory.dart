import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/class_controllder.dart';
import 'package:tmp/data/tutoring.dart';

class ClassFactory {

  Widget build(BuildContext context, Tutoring classItem) {
    // String path;
    // String category;
    // if(classItem.category == 'coding') {

    // }
    // else if(classItem.category == 'piano') {

    // }
    // else {

    // }
    return generate(context, classItem);
  }

  Widget generate(BuildContext context, Tutoring classItem) {
    final ClassController controller = Get.find<ClassController>();
    return GestureDetector(
      onTap: () {
        controller.selectedClass = classItem;
        Get.toNamed('/class_detail');
      },
      child: Container(
        // margin: EdgeInsets.only(
        //   left: MediaQuery.of(context).size.width * 0.05,
        //   right: MediaQuery.of(context).size.width * 0.05,
        // ),
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.3),
              width: 1
            )
          )
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.94,
          height: 150 - 16,
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
            top: 8,
            bottom: 8
          ),
          child: Row(
            children: [
              Container(
                width: 134,
                height: 134,
                // color: Colors.black.withOpacity(0.05),
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 114,
                  height: 114,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                      classItem.path
                    ),
                    fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 5,
                  top: 15
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width*0.87 - 139,
                      child: Text(
                        '${classItem.name} Class',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 0,
                        left: 5
                      ),
                      child: Text(
                        'tutor name',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.5)
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10
                      ),
                      height: 24,
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 24,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 5
                            ),
                            child: Text(
                              '5.0',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1.2
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 3
                            ),
                            child: Text(
                              '(123)',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10
                      ),
                      child: Text(
                        'University name   Major name',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black.withOpacity(0.3),

                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
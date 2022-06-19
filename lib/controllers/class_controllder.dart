import 'package:get/get.dart';
import 'package:tmp/data/tutoring.dart';

class ClassController extends GetxController {
  List<Tutoring> classes = [
    Tutoring(
      'coding',
      'assets/coding.jpg',
      'Coding'
    ),
    Tutoring(
      'piano',
      'assets/piano.jpg',
      'Piano'
    ),
    Tutoring(
      'coding',
      'assets/coding.jpg',
      'Coding'
    ),
    Tutoring(
      'english',
      'assets/english.jpg',
      'English'
    ),
    Tutoring(
      'piano',
      'assets/piano.jpg',
      'Piano'
    ),
    Tutoring(
      'piano',
      'assets/piano.jpg',
      'Piano'
    ),
    Tutoring(
      'coding',
      'assets/coding.jpg',
      'Coding'
    ),
    Tutoring(
      'english',
      'assets/english.jpg',
      'English'
    ),
    Tutoring(
      'english',
      'assets/english.jpg',
      'English'
    ),
    Tutoring(
      'coding',
      'assets/coding.jpg',
      'Coding'
    ),
    Tutoring(
      'piano',
      'assets/piano.jpg',
      'Piano'
    ),
  ];
  
  List<Tutoring> removedClasses = [];
  Tutoring? selectedClass;

  void updateFilter(List options) {
    print('aaa');
    List<Tutoring> updatedList = [];
    classes.addAll(removedClasses);
    print(classes);
    print(options);
    removedClasses.clear();
    classes.forEach((item) {
      if(options.contains(item.category) || options.isEmpty) {
        updatedList.add(item);
      }
      else {
        removedClasses.add(item);
      }
    });
    classes = updatedList;
    update();
  }
}
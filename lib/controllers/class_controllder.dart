import 'package:get/get.dart';
import 'package:tmp/data/tutoting.dart';

class ClassController extends GetxController {
  List<Tutoring> classes = [
    Tutoring('coding'),
    Tutoring('piano'),
    Tutoring('coding'),
    Tutoring('english'),
    Tutoring('piano'),
    Tutoring('piano'),
    Tutoring('coding'),
    Tutoring('english'),
    Tutoring('english'),
    Tutoring('coding'),
    Tutoring('piano'),
  ];
  
  List<Tutoring> removedClasses = [];
}
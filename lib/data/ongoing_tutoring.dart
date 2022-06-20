import 'package:tmp/data/tutoring.dart';

class OngoingTutoring extends Tutoring {
  late DateTime payDate;
  late DateTime dueDate;
  
  OngoingTutoring(
    super.category,
    super.path,
    super.name,
    this.payDate,
    this.dueDate
  );
  
}
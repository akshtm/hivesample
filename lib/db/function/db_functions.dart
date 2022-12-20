import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_student/db/function/model/data_model.dart';

ValueNotifier<List<StudentModel>> StudentListNotifier = ValueNotifier([]);

Future<void> adddstudent(StudentModel value) async {
  final studentdb = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentdb.add(value);
  value.id = _id;
  StudentListNotifier.value.add(value);
  StudentListNotifier.notifyListeners();
}

Future<void> getAllstudents() async {
  final studentdb = await Hive.openBox<StudentModel>('student_db');
  StudentListNotifier.value.clear();
  StudentListNotifier.value.addAll(studentdb.values);
  StudentListNotifier.notifyListeners();
}

Future<void> DeleteStudent(int id) async {
  final studentdb = await Hive.openBox<StudentModel>('student_db');
  studentdb.delete(id);
  getAllstudents();
  StudentListNotifier.notifyListeners();
}

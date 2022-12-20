import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(1)
  int? id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String age;
  StudentModel({required this.name, required this.age, this.id});
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini/model/person.dart';

const transactionDbName = 'student_db';

class DbfunctionProvider extends ChangeNotifier {
  List<Person> studentList = [];
//ValueNotifier<List<Person>> studentListNotifier = ValueNotifier([]);

  Future<void> addStudent(Person value) async {
    final studentDB = await Hive.openBox<Person>(transactionDbName);
    final id = await studentDB.add(value);
    value.id = id;

    getAllStudents();
    notifyListeners();
  }

  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<Person>(transactionDbName);
    studentList.clear();
    studentList.addAll(studentDB.values);
    notifyListeners();
    // studentListNotifier.value.clear();
    // studentListNotifier.value.addAll(studentDB.values);
    // studentListNotifier.notifyListeners();
  }

  Future<void> deleteStudent(index) async {
    final studentDB = await Hive.openBox<Person>(transactionDbName);
    await studentDB.delete(index);
    notifyListeners();
    getAllStudents();
  }

  Future<void> editstudent(index, Person value) async {
    final studentDB = await Hive.openBox<Person>(transactionDbName);
    studentList.clear();
    studentList.addAll(studentDB.values);
    studentDB.putAt(index, value);
    notifyListeners();
    getAllStudents();
    // studentListNotifier.value.clear();
    // studentListNotifier.value.addAll(studentDB.values);
    // studentListNotifier.notifyListeners();

    // studentDB.putAt(index, value);
    // getAllStudents();
  }
}

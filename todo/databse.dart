import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  //reference our box
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ["Make bed", false],
      ["exercise", false],
    ];
  }

  //load data from db
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  //update databse
  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }
}

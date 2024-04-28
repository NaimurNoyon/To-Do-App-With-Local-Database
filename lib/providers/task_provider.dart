import 'package:flutter/cupertino.dart';
import 'package:to_do_local_database/models/task_model.dart';
import '../helper/db_helper.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> noteList = [];

  Future<int> insertNote(TaskModel taskModel) =>
      DbHelper.insertNote(taskModel);

/*  void getAllNotes() async {
    noteList = await DbHelper.getAllNotes();
    notifyListeners();
  }

  Future<int> deleteNotes() =>
      DbHelper.deleteNotes();*/

}
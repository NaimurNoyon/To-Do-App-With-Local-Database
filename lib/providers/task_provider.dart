import 'package:flutter/cupertino.dart';
import 'package:to_do_local_database/models/task_model.dart';
import '../helper/db_helper.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskList = [];

  Future<int> insertTask(TaskModel taskModel) =>
      DbHelper.insertTask(taskModel);

  void getAllTasks() async {
    taskList = await DbHelper.getAllTasks();
    notifyListeners();
  }

  Future<int> deleteNotes() =>
      DbHelper.deleteTask(8);

  final data = TaskModel(dateTime: "55646574", title: 'edited', details: 'details', status: 'status', notificationStatus: 'notificationStatus', notificationTime: 'notificationTime');

  Future<int> editTask() =>
      DbHelper.editTask(8,data);

}
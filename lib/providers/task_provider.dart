import 'package:flutter/cupertino.dart';
import 'package:to_do_local_database/models/task_model.dart';
import '../helper/db_helper.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> taskList = [];
  bool isLoading = false;

  Future<void> insertTask(TaskModel taskModel) async{
    await DbHelper.insertTask(taskModel);
    getAllTasks();
    notifyListeners();
  }

  Future<void> getAllTasks() async {
    isLoading = true;
    taskList = await DbHelper.getAllTasks();
    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteNotes(int id) async{
    await DbHelper.deleteTask(id);
    getAllTasks();
  }

  final data = TaskModel(dateTime: "55646574", title: 'edited', details: 'details', status: 'status', notificationStatus: 'notificationStatus', notificationTime: 'notificationTime');

  Future<int> editTask(){
    return DbHelper.editTask(8,data);
  }


}
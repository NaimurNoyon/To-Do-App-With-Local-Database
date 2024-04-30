import 'package:path/path.dart' as Path;
import 'package:sqflite/sqflite.dart';
import 'package:to_do_local_database/models/task_model.dart';

class DbHelper {
  static const String createTableTask = '''create table $tableTask(
  $tableTaskColId integer primary key autoincrement,
  $tableTaskColDateTime text,
  $tableTaskColTitle text,
  $tableTaskColDetails text,
  $tableTaskColTaskStatus text,
  $tableTaskColNotificationStatus text,
  $tableTaskColNotificationTime text)''';


  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'task_db');

    return openDatabase(dbPath, version: 1, onCreate: (db, version) async{
      await db.execute(createTableTask);
    });
  }

  static Future<int> insertTask(TaskModel taskModel) async {
    final db = await open();
    return db.insert(tableTask, taskModel.toMap());
  }



  static Future<List<TaskModel>> getAllTasks() async {
    final db = await open();
    final mapList = await db.query(tableTask);
    return List.generate(mapList.length, (index) =>
        TaskModel.fromMap(mapList[index]));
  }

  static Future<int> deleteTask(int taskId) async {
    final db = await open();
    return db.delete(
      tableTask,
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }


/*  static Future<List<ZikirModel>> getAllZikirs() async {
    final db = await open();
    final mapList = await db.query(tableZikir);
    return List.generate(mapList.length, (index) =>
        ZikirModel.fromMap(mapList[index]));
  }


  Future<int> getTotalCountByName(String name) async {
    final db = await open();
    final result = await db.rawQuery(
        'SELECT SUM($tableZikirColCount) FROM $tableZikir WHERE $tableZikirColName = ?',
        [name]);
    return result.isNotEmpty ? result.first.values.first as int : 0;
  }


  static Future<int> getTotalCountByDate(String date) async {
    final db = await open();
    final result = await db.rawQuery(
        'SELECT SUM($tableZikirColCount) FROM $tableZikir WHERE $tableZikirColDate = ?',
        [date]);
    if (result.isNotEmpty && result.first.values.first != null) {
      return result.first.values.first as int;
    } else {
      return 0;
    }
  }*/
}
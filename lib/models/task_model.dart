const String tableTask = 'tbl_task';
const String tableTaskColId = 'id';
const String tableTaskColDateTime = 'date_time';
const String tableTaskColTitle = 'title';
const String tableTaskColDetails = 'details';
const String tableTaskColTaskStatus = 'status';
const String tableTaskColNotificationStatus = 'notification_status';
const String tableTaskColNotificationTime = 'notification_time';


class TaskModel {
  int? id;
  String dateTime;
  String title;
  String details;
  String status;
  String notificationStatus;
  String notificationTime;



  TaskModel({
    this.id,
    required this.dateTime,
    required this.title,
    required this.details,
    required this.status,
    required this.notificationStatus,
    required this.notificationTime
  });

  Map<String, dynamic> toMap(){
    final map = <String, dynamic>{
      tableTaskColDateTime : dateTime,
      tableTaskColTitle : title,
      tableTaskColDetails : details,
      tableTaskColTaskStatus : status,
      tableTaskColNotificationStatus : notificationStatus,
      tableTaskColNotificationTime : notificationTime
    };
    if(id != null){
      map[tableTaskColId] = id;
    }
    return map;
  }

  factory TaskModel.fromMap(Map<String, dynamic> map)=>
      TaskModel(
        id: map[tableTaskColId],
        dateTime: map[tableTaskColDateTime],
        title: map[tableTaskColTitle],
        details: map[tableTaskColDetails],
        status: map[tableTaskColTaskStatus],
        notificationStatus: map[tableTaskColNotificationStatus],
        notificationTime: map[tableTaskColNotificationTime]
      );
}

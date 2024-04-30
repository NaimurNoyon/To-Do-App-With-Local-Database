import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_local_database/providers/task_provider.dart';
import 'package:to_do_local_database/screens/add_task_screen.dart';

import '../utils/colors.dart';

class AllToDoScreen extends StatefulWidget {
  const AllToDoScreen({super.key});

  @override
  State<AllToDoScreen> createState() => _AllToDoScreenState();
}

class _AllToDoScreenState extends State<AllToDoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).getAllTasks();
  }
  @override
  Widget build(BuildContext context) {
    //final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Consumer<TaskProvider>(
        builder: (context, taskProvider, child){
          return Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
                backgroundColor: primaryColor,
                toolbarHeight: 74,
                title: const Text(
                  "TODO APP",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                )
            ),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: primaryColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddTaskScreen()));
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: taskProvider.isLoading?
            const Center(child: CircularProgressIndicator()) :
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: taskProvider.taskList.length,
                itemBuilder: (context, index){
                  var task = taskProvider.taskList[index];
                  return Stack(
                    children: [
                      Container(
                        height: 90,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        margin: EdgeInsets.only(top: 16,left: 8,right: 8,bottom: index == taskProvider.taskList.length - 1 ? 90 : 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formatTimestamp(int.parse(task.dateTime)),
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              task.title,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              task.details,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 16,
                        child: PopupMenuButton(
                          color: Colors.white,
                          position: PopupMenuPosition.under,
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                onTap: (){
                                  taskProvider.editTask();
                                },
                                value: 'option1',
                                child: const Row(
                                  children: [
                                    Icon(Icons.edit_outlined),
                                    SizedBox(width: 8,),
                                    Text('Edit'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () async{
                                  await taskProvider.deleteNotes(task.id!);
                                },
                                value: 'option2',
                                child: const Row(
                                  children: [
                                    Icon(Icons.delete_forever_outlined),
                                    SizedBox(width: 8,),
                                    Text('Delete'),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'option3',
                                child: Row(
                                  children: [
                                    Icon(Icons.check_circle_outline),
                                    SizedBox(width: 8,),
                                    Text('Mark as done'),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'option4',
                                child: Row(
                                  children: [
                                    Icon(Icons.notifications_active_outlined),
                                    SizedBox(width: 8,),
                                    Text('Turn On Notification'),
                                  ],
                                ),
                              ),
                            ];
                          },
                          onSelected: (value) {
                            // Handle option selection
                            debugPrint('Selected: $value');
                          },
                        ),
                      )
                    ],
                  );
                }
            ),
          );
        }
    );
  }

  //Formatting datetime for ui
  String formatTimestamp(int timestamp) {
    DateTime postTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate = DateFormat('d MMMM y').format(postTime);
    return formattedDate;
  }
}

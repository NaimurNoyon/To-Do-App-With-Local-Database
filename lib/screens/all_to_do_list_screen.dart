import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_local_database/screens/add_task_screen.dart';

import '../utils/colors.dart';

class AllToDoScreen extends StatelessWidget {
  const AllToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index){
            return Container(
              padding: EdgeInsets.all(18),
              margin: EdgeInsets.only(top: 16,left: 8,right: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TODO TITLE",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: primaryColor
                        ),
                      ),
                      SizedBox(height: 6,),
                      Text(
                        "TODO SUB TITLE",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        /*Icon(Icons.edit_outlined),
                        Icon(Icons.delete_forever_outlined),
                        Icon(Icons.check_circle_outline),*/
                        //Icon(Icons.notifications_active_outlined),
                        PopupMenuButton(
                          color: bgColor,
                          position: PopupMenuPosition.under,
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                onTap: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  ).then((selectedDate) {
                                    // After selecting the date, display the time picker.
                                    if (selectedDate != null) {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((selectedTime) {
                                        // Handle the selected date and time here.
                                        if (selectedTime != null) {
                                          DateTime selectedDateTime = DateTime(
                                            selectedDate.year,
                                            selectedDate.month,
                                            selectedDate.day,
                                            selectedTime.hour,
                                            selectedTime.minute,
                                          );
                                          print(selectedDateTime); // You can use the selectedDateTime as needed.
                                        }
                                      });
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.edit_outlined),
                                    Text('Edit'),
                                  ],
                                ),
                                value: 'option1',
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(Icons.delete_forever_outlined),
                                    Text('Delete'),
                                  ],
                                ),
                                value: 'option2',
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(Icons.check_circle_outline),
                                    Text('Mark as done'),
                                  ],
                                ),
                                value: 'option3',
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(Icons.notifications_active_outlined),
                                    Text('Turn On Notification'),
                                  ],
                                ),
                                value: 'option4',
                              ),
                            ];
                          },
                          onSelected: (value) {
                            // Handle option selection
                            print('Selected: $value');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}

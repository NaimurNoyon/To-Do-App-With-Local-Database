import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:provider/provider.dart';
import 'package:to_do_local_database/models/task_model.dart';
import 'package:to_do_local_database/providers/task_provider.dart';
import 'package:to_do_local_database/utils/colors.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          backgroundColor: primaryColor,
          toolbarHeight: 74,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Add Task",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          )
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  //controller: ,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  //controller: ,
                  maxLines: null,
                  minLines: 1,
                  decoration: const InputDecoration(
                      hintText: 'Details',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 3, 5),
                        maxTime: DateTime(2019, 6, 7),
                        theme: picker.DatePickerTheme(
                            headerColor: primaryColor,
                            backgroundColor: bgColor,
                            itemStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            doneStyle: TextStyle(color: Colors.red, fontSize: 16)),
                        onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'show date time picker (Chinese)',
                    style: TextStyle(color: primaryColor),
                  )),
              GestureDetector(
                onTap: (){
                  final task = TaskModel(
                      dateTime: '67654654685',
                    title: 'Todo one',
                    details: 'This is todo one',
                    status: 'Upcoming',
                    notificationStatus: 'Active',
                    notificationTime: '20'
                  );
                  taskProvider.insertTask(task).then((value) {
                    print("doneeeee");
                    //taskProvider.getAllNotes();
                  }).catchError((error) {
                    print(error.toString());
                  });
                },
                child: Container(
                  height: 56,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Center(
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

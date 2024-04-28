import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CompletedToDoListScreen extends StatelessWidget {
  const CompletedToDoListScreen({super.key});

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
                ],
              ),
            );
          }
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './pages/task_list.dart'; 

void main() {
  runApp(TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management', 
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: TaskListPage(), 
    );
  }
}

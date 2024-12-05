import 'package:flutter/material.dart';
import 'task_details.dart'; 
import 'task_form.dart';    

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  
  List<Map<String, String>> tasks = [];

  void addTask(Map<String, String> task) {
    setState(() {
      tasks.add(task); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'), 
      ),
      body: tasks.isEmpty
          ? Center(child: Text('No tasks available')) 
          : ListView.builder(
              itemCount: tasks.length, 
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]['title'] ?? ''),
                  subtitle: Text(tasks[index]['description'] ?? ''), 
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailsPage(task: tasks[index]),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskFormPage()),
          ).then((newTask) {
            
            if (newTask != null) {
              Map<String, String> formattedTask = {
                'title': newTask['title'] ?? '',
                'description': newTask['description'] ?? '',
                'startDate': newTask['startDate'] ?? '',
                'endDate': newTask['endDate'] ?? '',
              };
              addTask(formattedTask);  
            }
          });
        },
        child: Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }
}


class TaskDetailsPage extends StatelessWidget {
  final Map<String, String> task;

  TaskDetailsPage({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${task['title']}',
             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Description: ${task['description']}',
              style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Start Date: ${task['startDate']}', 
             style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('End Date: ${task['endDate']}',
              style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

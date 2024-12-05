import 'package:flutter/material.dart';

class TaskFormPage extends StatefulWidget {
  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: ValueKey('taskTitleField'), 
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Task Title',
                ),
                autofillHints: [AutofillHints.name], 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: ValueKey('taskDescriptionField'), 
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Task Description',
                ),
                autofillHints: [AutofillHints.jobTitle], 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              
              TextFormField(
                key: ValueKey('startDateField'),
                decoration: InputDecoration(labelText: 'Start Date'),
                readOnly: true,
                onTap: () async {
                  _startDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                },
              ),
             
              TextFormField(
                key: ValueKey('endDateField'),
                decoration: InputDecoration(labelText: 'End Date'),
                readOnly: true,
                onTap: () async {
                  _endDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = {
                      'title': _titleController.text.trim(),
                      'description': _descriptionController.text.trim(),
                      'startDate': _startDate?.toString() ?? '', 
                      'endDate': _endDate?.toString() ?? '',
                    };

                    Navigator.pop(context, task);
                  }
                },
                child: Text('Save Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

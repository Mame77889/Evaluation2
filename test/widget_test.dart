// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taskmanagement/main.dart';

void main() {
   testWidgets('TaskManagementApp loads and shows the initial page', (WidgetTester tester) async {
    
    await tester.pumpWidget(TaskManagementApp());


    expect(find.text('Task List'), findsOneWidget); 

    
    expect(find.byIcon(Icons.add), findsOneWidget); 
  });

  testWidgets('Adding a task updates the list', (WidgetTester tester) async {
  
    await tester.pumpWidget(TaskManagementApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(); 

   
    expect(find.text('Title'), findsOneWidget); 
  });
}

import 'package:flutter/material.dart';
import 'package:medi_alert/views/home_view.dart';

void main() {
  runApp(const MedicationReminderApp());
}

class MedicationReminderApp extends StatelessWidget {
  const MedicationReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Reminder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homeview(),
    );
  }
}

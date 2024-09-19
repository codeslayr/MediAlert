import 'package:flutter/material.dart';
import 'package:medi_alert/service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MedicationReminderApp());
}

class MedicationReminderApp extends StatelessWidget {
  const MedicationReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Reminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homeview(),
    );
  }
}

class Homeview extends StatelessWidget {
  final NotificationService notificationService = NotificationService();

  Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Reminder'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Schedule Medication Reminder'),
          onPressed: () {
            DateTime scheduledTime = DateTime.now()
                .add(Duration(seconds: 10)); // Example: 10 seconds later
            notificationService.scheduleNotification(
              1,
              'Medication Reminder',
              'Time to take your medication!',
              scheduledTime,
            );
          },
        ),
      ),
    );
  }
}

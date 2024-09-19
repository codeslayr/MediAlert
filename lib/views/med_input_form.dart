import 'package:flutter/material.dart';

class MedicationInput extends StatefulWidget {
  @override
  _MedicationInputState createState() => _MedicationInputState();
}

class _MedicationInputState extends State<MedicationInput> {
  final _formKey = GlobalKey<FormState>();
  String medicationName = '';
  String dosage = '';
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medication'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Medication Name'),
                onSaved: (value) {
                  medicationName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Dosage'),
                onSaved: (value) {
                  dosage = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: Text('Select Time'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save medication data
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Medication'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}

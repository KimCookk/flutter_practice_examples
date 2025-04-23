import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Date & Time Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2099),
                );

                setState(() {
                  _selectedDate = selectedDate;
                });
              },
              child: Text('Date Picker'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                setState(() {
                  _selectedTime = selectedTime;
                });
              },
              child: Text('Time Picker'),
            ),
            SizedBox(
              height: 15,
            ),
            Builder(builder: (context) {
              if (_selectedDate != null && _selectedTime != null) {
                DateTime selectedDateTime = DateTime(
                  _selectedDate!.year,
                  _selectedDate!.month,
                  _selectedDate!.day,
                  _selectedTime!.hour,
                  _selectedTime!.minute,
                );
                return Text(
                  'Selected Date : ${DateFormat('yyyy-MM-dd hh:mm').format(selectedDateTime)}',
                );
              } else {
                return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }
}

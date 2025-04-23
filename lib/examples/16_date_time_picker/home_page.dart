import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _selectedDate;
  DateTime? _selectedTime;

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
                DateTime now = DateTime.now();
                DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(now.year, now.month, now.day),
                  maxTime: DateTime(2099, 12, 31),
                  currentTime: DateTime.now(),
                  locale: LocaleType.ko,
                  onChanged: (date) {
                    print('change $date');
                  },
                  onConfirm: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                );
              },
              child: Text('Date Picker'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                DatePicker.showTimePicker(
                  context,
                  showTitleActions: true,
                  locale: LocaleType.ko,
                  onChanged: (date) {
                    print('change $date');
                  },
                  onConfirm: (date) {
                    setState(() {
                      _selectedTime = date;
                    });
                  },
                );
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

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'notificationService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? selectedDate;
  DateTime? selectedTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Notificationservice.showNotification(
                    title: '테스트', body: '로컬 알림 테스트!');
              },
              child: Text('Show Push Notification'),
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedDate == null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        content: Text('Please selected date'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'OK');
                            },
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (selectedTime == null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        content: Text('Please selected time'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'OK');
                            },
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  final scheduled = DateTime(
                    selectedDate!.year,
                    selectedDate!.month,
                    selectedDate!.day,
                    selectedTime!.hour,
                    selectedTime!.minute,
                  );

                  Notificationservice.showScheduledNotification(
                    title: '예약 알림',
                    body: '10초 뒤에 도착하는 알림',
                    scheduledTime: scheduled,
                  );
                  debugPrint("📅 알림 예약됨: ${scheduled.toLocal()}");
                }
              },
              child: Text('Select Date Push Notification'),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    DateTime now = DateTime.now();
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(now.year, now.month, now.day),
                      maxTime: DateTime(2099, 12, 31),
                      currentTime: DateTime.now(),
                      locale: LocaleType.ko,
                      onChanged: (time) {},
                      onConfirm: (time) {
                        setState(() {
                          selectedDate = time;
                        });
                      },
                    );
                  },
                  child: Text('Date Picker'),
                ),
                SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    DatePicker.showTimePicker(
                      context,
                      showTitleActions: true,
                      showSecondsColumn: false,
                      locale: LocaleType.ko,
                      onChanged: (time) {},
                      onConfirm: (time) {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                    );
                  },
                  child: Text('Time Picker'),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Builder(builder: (context) {
              if (selectedDate != null && selectedTime != null) {
                DateTime selectedDateTime = DateTime(
                    selectedDate!.year,
                    selectedDate!.month,
                    selectedDate!.day,
                    selectedTime!.hour,
                    selectedTime!.minute);
                return Text('Selected DateTime : $selectedDateTime');
              } else {
                return SizedBox();
              }
            }),
            SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
              onPressed: () {
                Notificationservice.printScheduledNotificaiton();
              },
              child: Text('Show Push Notification List'),
            ),
          ],
        ),
      ),
    );
  }
}

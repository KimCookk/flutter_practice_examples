import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/16_date_time_picker/home_page.dart';

void main() {
  runApp(DateTimePickerApp());
}

class DateTimePickerApp extends StatelessWidget {
  const DateTimePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}

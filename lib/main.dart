import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/01_column_row/column_row_example.dart';
import 'package:flutter_practice_examples/examples/02_widget_size/widget_size_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ExampleSelector(),
    );
  }
}

class ExampleSelector extends StatelessWidget {
  final List<_ExampleItem> examples = [
    _ExampleItem(
      title: '01. Column Row 예제',
      widget: ColumnRowExample(),
    ),
    _ExampleItem(
      title: '02. Widget Size 예제',
      widget: WidgetSizeExample(),
    ),
    //_ExampleItem(title: '03. Stateful Counter', widget: CounterExample()),
  ];

  ExampleSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter 예제 셀렉터')),
      body: ListView.builder(
        itemCount: examples.length,
        itemBuilder: (context, index) {
          final example = examples[index];
          return ListTile(
            title: Text(example.title),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => example.widget),
              );
            },
          );
        },
      ),
    );
  }
}

class _ExampleItem {
  final String title;
  final Widget widget;

  _ExampleItem({required this.title, required this.widget});
}

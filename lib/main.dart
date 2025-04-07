import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/01_column_row/column_row_example.dart';
import 'package:flutter_practice_examples/examples/02_widget_size/widget_size_example.dart';
import 'package:flutter_practice_examples/examples/03_expanded/expanded_example.dart';
import 'package:flutter_practice_examples/examples/04_flexible/flexible_example.dart';
import 'package:flutter_practice_examples/examples/05_align_padding/align_padding_example.dart';
import 'package:flutter_practice_examples/examples/06_listView/listView_example.dart';
import 'package:flutter_practice_examples/examples/07_stateful_widget/bird_example.dart';
import 'package:flutter_practice_examples/examples/07_stateful_widget/counter_example.dart';
import 'package:flutter_practice_examples/examples/08_textfield/textfield_example.dart';
import 'package:flutter_practice_examples/examples/09_textformfield/textformfield_example.dart';
import 'package:flutter_practice_examples/examples/10_navigator/bottom_bar/navigator_bottom_bar_example.dart';
import 'package:flutter_practice_examples/examples/10_navigator/login/navigator_example.dart';
import 'package:flutter_practice_examples/examples/10_navigator/named_routes/route_app.dart';
import 'package:flutter_practice_examples/examples/example_scaffold.dart';

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
  final List<ExampleItem> examples = [
    ExampleItem(
      title: '01. Column Row 예제',
      widget: ColumnRowExample(),
    ),
    ExampleItem(
      title: '02. Widget Size 예제',
      widget: WidgetSizeExample(),
    ),
    ExampleItem(
      title: '03. Expanded 예제',
      widget: ExpandedExample(),
    ),
    ExampleItem(
      title: '04. Flexible 예제',
      widget: FlexibleExample(),
    ),
    ExampleItem(
      title: '05. Align Padding 예제',
      widget: AlignPaddingExample(),
    ),
    ExampleItem(
      title: '06. List View 예제',
      widget: ListViewExample(),
    ),
    ExampleItem(
      title: '07_1. StatefulWidget 예제',
      widget: BirdExample(),
    ),
    ExampleItem(
      title: '07_2. StatefulWidget 예제',
      widget: CounterExample(),
    ),
    ExampleItem(
      title: '08. TextField 예제',
      widget: TextfieldExample(),
    ),
    ExampleItem(
      title: '09. TextFormField 예제',
      widget: TextFormFieldExample(),
    ),
    ExampleItem(
      title: '10_1. Navigator 예제',
      widget: NavigatorExample(),
    ),
    ExampleItem(
      title: '10_2. Navigator 예제',
      widget: NavigatorBottomBarExample(),
    )
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
                MaterialPageRoute(
                    builder: (_) => ExampleScaffold(item: example)),
              );
            },
          );
        },
      ),
    );
  }
}

class ExampleItem {
  final String title;
  final Widget widget;

  ExampleItem({required this.title, required this.widget});
}

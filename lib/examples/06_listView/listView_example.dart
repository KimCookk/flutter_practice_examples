import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => '아이템 ${index + 1}');

  ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(items[index]),
    //       leading: const Icon(Icons.label),
    //       trailing: const Icon(Icons.chevron_right),
    //       onTap: () {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(content: Text('${items[index]} 클릭됨')),
    //         );
    //       },
    //     );
    //   },
    // );
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          leading: const Icon(Icons.label),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${items[index]} 클릭됨')),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
          height: 10,
        );
      },
    );
  }
}

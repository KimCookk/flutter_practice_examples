import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State {
  final tags = ['Flutter', 'Dart', 'Provider', 'Riverpod', 'Bloc', 'Hooks'];
  final selected = <String>{};

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Example Page'),
      ),
      body: Center(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: tags.map(
            (tag) {
              final isSelected = selected.contains(tag);
              return ChoiceChip(
                label: Text(tag),
                selected: isSelected,
                onSelected: (value) {
                  setState(() {
                    isSelected ? selected.remove(tag) : selected.add(tag);
                  });
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

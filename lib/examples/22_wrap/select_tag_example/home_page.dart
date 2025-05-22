import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/22_wrap/select_tag_example/home_page_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomePageState>();
    final unSelectedTags = state.unSelectedTags;
    final selectedTags = state.selectedTags;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Example Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('UnSelected'),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: unSelectedTags.map(
                (tag) {
                  return ChoiceChip(
                    label: Text(tag),
                    selected: false,
                    onSelected: (value) {
                      context.read<HomePageState>().select(tag);
                    },
                  );
                },
              ).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Selected'),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: selectedTags.map(
                (tag) {
                  return ChoiceChip(
                    label: Text(tag),
                    selected: true,
                    onSelected: (value) {
                      context.read<HomePageState>().unselect(tag);
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

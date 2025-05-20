import 'package:flutter/material.dart';

class HomePageState extends ChangeNotifier {
  List<String> unSelectedTags = [
    'Flutter',
    'Dart',
    'Provider',
    'Riverpod',
    'Bloc',
    'Hooks'
  ];
  List<String> selectedTags = [];

  void select(String tag) {
    if (unSelectedTags.contains(tag)) {
      unSelectedTags.remove(tag);
      selectedTags.add(tag);
      notifyListeners();
    }
  }

  void unselect(String tag) {
    if (selectedTags.contains(tag)) {
      selectedTags.remove(tag);
      unSelectedTags.add(tag);
      notifyListeners();
    }
  }
}

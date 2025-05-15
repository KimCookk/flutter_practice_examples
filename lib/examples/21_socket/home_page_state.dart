import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/21_socket/message.dart';
import 'package:flutter_practice_examples/examples/21_socket/socket_service.dart';

class HomePageState extends ChangeNotifier {
  final SocketService _socketService = SocketService();

  bool _isConnected = false;
  final List<Message> _messages = [];

  bool get isConnected => _isConnected;
  List<Message> get messages => _messages;

  void setIsConnect(bool isConnect) {
    _isConnected = isConnect;
    notifyListeners();
  }

  HomePageState() {
    _socketService.disConnect = () {
      setIsConnect(false);
    };

    _socketService.onConnect = () {
      setIsConnect(true);
    };

    _socketService.reciveMessage = (String message) {
      receiveMessage(message);
    };
  }

  void connect() {
    _socketService.connect();
  }

  void disconnect() {
    _socketService.disConnect();
  }

  void sendMessage(String message) {
    _socketService.sendMessage(message);
    _messages.add(Message(
      message: message,
      type: MessageType.send,
    ));
    notifyListeners();
  }

  void receiveMessage(String message) {
    _messages.add(Message(
      message: message,
      type: MessageType.receive,
    ));
    notifyListeners();
  }

  Message getMessage(int index) {
    return messages.reversed.toList()[index];
  }
}

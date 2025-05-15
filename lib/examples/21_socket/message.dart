import 'package:flutter/material.dart';

enum MessageType { send, receive }

class Message {
  String message;
  MessageType type;

  Message({
    required this.message,
    required this.type,
  });

  @override
  String toString() {
    switch (type) {
      case MessageType.send:
        {
          return '[SEND] $message';
        }
      case MessageType.receive:
        {
          return '[RECEIVE] $message';
        }
    }
  }
}

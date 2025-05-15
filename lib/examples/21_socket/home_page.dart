import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/21_socket/home_page_state.dart';
import 'package:flutter_practice_examples/examples/21_socket/message.dart';
import 'package:flutter_practice_examples/examples/21_socket/socket_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var state = context.watch<HomePageState>();
    bool isConnected = state.isConnected;

    return Scaffold(
      appBar: AppBar(
        title: Text("Socket Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var message =
                        context.read<HomePageState>().getMessage(index);
                    return Row(
                      mainAxisAlignment: message.type == MessageType.receive
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Text(message.toString()),
                      ],
                    );
                  },
                  itemCount: state.messages.length,
                ),
              ),
              TextField(
                controller: _editingController,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      isConnected
                          ? context.read<HomePageState>().disconnect()
                          : context.read<HomePageState>().connect();
                    },
                    child: isConnected ? Text('Disconnect') : Text('Connect'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: isConnected
                        ? () {
                            context
                                .read<HomePageState>()
                                .sendMessage(_editingController.text);
                            _editingController.clear();
                          }
                        : null,
                    child: Text('Send'),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

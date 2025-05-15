import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;
  late Function() onConnect;
  late Function() disConnect;
  late Function(String message) reciveMessage;

  void connect() {
    socket = IO.io('http://10.0.2.2:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((_) {
      print('Connected to socket server');
      socket.emit('join', 'flutter_user');
      onConnect();
    });

    socket.on('client', (data) {
      print('[Recive Message] $data');
      reciveMessage(data.toString());
    });

    socket.onDisconnect((_) {
      print('Disconnected to socket server');
      disConnect();
    });
  }

  void sendMessage(String message) {
    socket.emit('server', message);
  }

  void disconnect() {
    socket.disconnect();
  }
}

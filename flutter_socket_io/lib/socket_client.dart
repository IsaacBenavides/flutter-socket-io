import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketConnection {
  IO.Socket? socket;

  SocketConnection() {
    _initConnection();
  }

  _initConnection() {
    socket = IO.io('http://0.0.0.0:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.on('connect', (_) {
      print('connect');
    });
    socket!.on('event', (data) => print(data));
    socket!.on('disconnect', (_) => print('disconnect'));
    socket!.on('fromServer', (_) => print(_));
    socket!.connect();
  }
}

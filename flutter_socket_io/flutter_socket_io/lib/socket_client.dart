import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketConnection {
  IO.Socket? socket;
  dynamic _data;

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

  void emitInformation(String? event, dynamic data) {
    socket!.emit(event!, data);
  }

  void on(String? event) {
    socket!.on(event!, (response) {
      socketData = response;
    });
  }

  set socketData(data) {
    _data = data;
  }

  get socketData {
    return this._data;
  }
}

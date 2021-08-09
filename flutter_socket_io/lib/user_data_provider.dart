import 'package:flutter/material.dart';
import 'package:flutter_socket_io/socket_client.dart';

class UserDataProvider extends ChangeNotifier {
  SocketConnection _socketConnection = SocketConnection();
  dynamic _socketData;

  get socketData {
    return this._socketData;
  }

  set socketData(data) {
    _socketData = data;
    notifyListeners();
  }

  void emitSocketData(Map data) {
    _socketConnection.socket!.emit("user_connected", data);
  }

  void getSocketData() {
    _socketConnection.socket!.emit("get_users_data", "");
    _socketConnection.socket!.on("users_connected", (data) {
      socketData = data;
    });
  }
}

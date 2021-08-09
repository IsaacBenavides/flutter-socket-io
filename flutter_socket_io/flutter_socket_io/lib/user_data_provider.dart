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
    _socketConnection.emitInformation("user_connected", data);
  }

  void getSocketData() {
    _socketConnection.emitInformation("get_users_data", "");
    _socketConnection.on("users_connected");
    socketData = _socketConnection.socketData;
  }
}

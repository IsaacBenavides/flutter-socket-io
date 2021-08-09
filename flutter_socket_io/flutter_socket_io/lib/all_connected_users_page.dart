import 'package:flutter/material.dart';
import 'package:flutter_socket_io/socket_client.dart';
import 'package:flutter_socket_io/user_data_provider.dart';
import 'package:provider/provider.dart';

class AllConnectedUsersPage extends StatefulWidget {
  @override
  _AllConnectedUsersPageState createState() => _AllConnectedUsersPageState();
}

class _AllConnectedUsersPageState extends State<AllConnectedUsersPage> {
  UserDataProvider? _userDataProvider;

  @override
  void didChangeDependencies() {
    _userDataProvider = Provider.of<UserDataProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All connected user"),
      ),
      body: Column(
        children: [Text(_userDataProvider!.socketData.toString())],
      ),
    );
  }
}

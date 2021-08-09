import 'package:flutter/material.dart';
import 'package:flutter_socket_io/data_page.dart';
import 'package:flutter_socket_io/socket_client.dart';
import 'package:flutter_socket_io/user_data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: DataPage(),
      ),
    );
  }
}

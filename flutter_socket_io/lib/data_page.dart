import 'package:flutter/material.dart';
import 'package:flutter_socket_io/all_connected_users_page.dart';
import 'package:flutter_socket_io/user_data_provider.dart';
import 'package:provider/provider.dart';

class DataPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserDataProvider _userDataProvider = Provider.of<UserDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: "Apellido"),
            ),
            ElevatedButton(
              onPressed: () {
                _userDataProvider.emitSocketData({
                  "name": firstNameController.text,
                  "last_name": lastNameController.text
                });
                _userDataProvider.getSocketData();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => AllConnectedUsersPage()));
              },
              child: Text("Ver conectados"),
            )
          ],
        ),
      ),
    );
  }
}

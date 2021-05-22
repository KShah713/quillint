import 'package:flutter/material.dart';
import 'package:quillint/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Quillint'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0,
        actions: [
          ElevatedButton.icon(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('Logout'),
          )
        ],
      ),
    );
  }
}

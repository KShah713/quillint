import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quillint/models/user.dart';
import 'package:quillint/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:quillint/services/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
        home: Initialize(),
      ),
  );
}

class Initialize extends StatefulWidget {
  @override
  _InitializeState createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Scaffold(
        body: Text('ERROR'),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Scaffold(body: Text('Loading'));
    }

    return Scaffold(
      body: StreamProvider.value(
        initialData: UserInformation(),
        value: AuthService().user,
        child: Wrapper()),
    );
  }
}

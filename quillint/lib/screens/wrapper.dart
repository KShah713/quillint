import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quillint/screens/authenticate/authenticate.dart';
import 'package:quillint/models/user.dart';
import 'package:quillint/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserInformation>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

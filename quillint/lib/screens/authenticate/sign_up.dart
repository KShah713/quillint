import 'package:flutter/material.dart';
import 'package:quillint/services/auth.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';

  //password field state
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Sign Up'),
        elevation: 0,
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Sign In'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                // validator returns null if the form field is valid else returns a string citing the help text
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 7
                    ? 'Enter a password having 7+ characters '
                    : null,
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  // this if statement is true if the validators return null instead of a string
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        _auth.signUpWithEmailPassword(email, password);
                    result.then((res) {
                      if (result == null) {
                        setState(() {
                          error = 'Enter a valid email ID';
                          print(error);
                        });
                      }
                    });
                  }
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  height: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

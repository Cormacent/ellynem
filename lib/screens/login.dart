import 'package:firebase_auth/firebase_auth.dart';

import '../services/authentication.dart';
import 'package:flutter/material.dart';

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _userName;
  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_formType == FormType.login) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          print('Registered user: $userId');

          widget.auth.getCurrentUser().then((user){
            UserUpdateInfo userUpdate = UserUpdateInfo();
            userUpdate.displayName = _userName;
            user.updateProfile(userUpdate);
          });
        }
        if (userId.length > 0 &&
            userId != null &&
            (_formType == FormType.login)) {
          widget.loginCallback();
        }
        // widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Container(
                color: Colors.yellow[700],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          fontFamily: 'Yellowtail',
                          fontSize: 70,
                          color: Colors.grey[600],
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 90.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: buildInputs() + buildSubmitButtons(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    if (_formType == FormType.login) {
      return <Widget>[
        TextFormField(
          key: Key('email'),
          cursorColor: Colors.yellow[700],
          decoration: InputDecoration(
              labelText: 'Email',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              focusColor: Colors.yellow[700],
              hoverColor: Colors.yellow[700],
              labelStyle: TextStyle(
                  decorationColor: Colors.yellow[700],
                  color: Colors.yellow[700])),
          validator: EmailFieldValidator.validate,
          onSaved: (String value) => _email = value,
        ),
        TextFormField(
          key: Key('password'),
          decoration: InputDecoration(
              labelText: 'Password',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              focusColor: Colors.yellow[700],
              hoverColor: Colors.yellow[700],
              labelStyle: TextStyle(
                  decorationColor: Colors.yellow[700],
                  color: Colors.yellow[700])),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          onSaved: (String value) => _password = value,
        ),
      ];
    } else {
      return <Widget>[
        TextFormField(
          key: Key('username'),
          cursorColor: Colors.yellow[700],
          decoration: InputDecoration(
              labelText: 'Username',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              focusColor: Colors.yellow[700],
              hoverColor: Colors.yellow[700],
              labelStyle: TextStyle(
                  decorationColor: Colors.yellow[700],
                  color: Colors.yellow[700])),
          validator: EmailFieldValidator.validate,
          onSaved: (String value) => _userName = value,
        ),
        TextFormField(
          key: Key('email'),
          cursorColor: Colors.yellow[700],
          decoration: InputDecoration(
              labelText: 'Email',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              focusColor: Colors.yellow[700],
              hoverColor: Colors.yellow[700],
              labelStyle: TextStyle(
                  decorationColor: Colors.yellow[700],
                  color: Colors.yellow[700])),
          validator: EmailFieldValidator.validate,
          onSaved: (String value) => _email = value,
        ),
        TextFormField(
          key: Key('password'),
          decoration: InputDecoration(
              labelText: 'Password',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              focusColor: Colors.yellow[700],
              hoverColor: Colors.yellow[700],
              labelStyle: TextStyle(
                  decorationColor: Colors.yellow[700],
                  color: Colors.yellow[700])),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          onSaved: (String value) => _password = value,
        ),
      ];
    }
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return <Widget>[
        RaisedButton(
          key: Key('signIn'),
          splashColor: Colors.orange,
          color: Colors.yellow[700],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Text('Login',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child: Text('Create an account', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return <Widget>[
        RaisedButton(
          splashColor: Colors.orange,
          color: Colors.yellow[700],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Text('Register', style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child:
              Text('Have an account? Login', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}

import 'package:ellynem/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:ellynem/screens/cart.dart';
import 'package:ellynem/screens/checkout.dart';
import 'package:ellynem/screens/history.dart';
import 'package:ellynem/screens/home.dart';
import 'package:ellynem/screens/item.dart';
import './services/authentication.dart';

class RoutePagesLogin extends StatefulWidget {
  RoutePagesLogin({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _RoutePagesLoginState createState() => _RoutePagesLoginState();
}

class _RoutePagesLoginState extends State<RoutePagesLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(
              auth: widget.auth,
              logoutCallback: widget.logoutCallback,
            ),
        '/history': (context) => HistoryTransaction(),
        '/item': (context) => Item(
              userId: widget.userId,
              auth: widget.auth,
            ),
        '/cart': (context) => Cart(),
        '/checkout': (context) => Checkout(),
      },
    );
  }
}

class RoutePagesNotLogin extends StatefulWidget {
  RoutePagesNotLogin(
      {Key key,
      this.auth,
      this.userId,
      this.logoutCallback,
      this.loginCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final VoidCallback loginCallback;
  final String userId;
  @override
  _RoutePagesNotLoginState createState() => _RoutePagesNotLoginState();
}

class _RoutePagesNotLoginState extends State<RoutePagesNotLogin> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(
              auth: widget.auth,
            ),
        '/item': (context) => Item(
              auth: widget.auth,
            ),
        '/login': (context) => LoginPage(
              auth: widget.auth,
              loginCallback: widget.loginCallback,
            ),
      },
    );
  }
}

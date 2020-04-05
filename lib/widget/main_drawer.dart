import 'package:flutter/material.dart';
import '../services/authentication.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer(
      {Key key, this.auth, this.logoutCallback, this.userEmail, this.userName})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userEmail, userName;
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String _userEmail = "";
  String _userName = "";
  @override
  void initState() {
    _userEmail = widget.userEmail;
    _userName = widget.userName;
    super.initState();
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
      Fluttertoast.showToast(
          msg: "Logout",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.orange,
          textColor: Colors.white);
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.yellow[700],
              child: (_userEmail != "")
                  ? Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/icons/brownie.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        // ),
                        Text(
                          '$_userName',
                          style: TextStyle(
                              fontFamily: 'RamblaBold',
                              fontSize: 20,
                              color: Colors.grey[600]),
                        ),
                        Text(
                          '$_userEmail',
                          style: TextStyle(
                              fontFamily: 'RamblaBold',
                              fontSize: 16,
                              color: Colors.grey[600]),
                        ),
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/icons/brownie.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        // ),
                        Text(
                          'You are not logged in',
                          style: TextStyle(
                              fontFamily: 'RamblaBold',
                              fontSize: 20,
                              color: Colors.grey[600]),
                        ),
                        Text(
                          'You are not logged in',
                          style: TextStyle(
                              fontFamily: 'RamblaBold',
                              fontSize: 16,
                              color: Colors.grey[600]),
                        ),
                      ],
                    ),
            ),
            (_userEmail != "")
                ? Column(
                    children: <Widget>[
                      CustomListTile(Icons.history, 'Riwayat Pembelian',
                          () => {Navigator.of(context).pushNamed('/cart')}),
                      CustomListTile(Icons.info_outline, 'Order', () => {}),
                      CustomListTile(Icons.help_outline, 'Help', () => {}),
                      CustomListTile(
                          Icons.power_settings_new, 'Sign Out', signOut)
                    ],
                  )
                : Column(
                    children: <Widget>[
                      CustomListTile(Icons.history, 'Riwayat Pembelian',
                          () => {Navigator.of(context).pushNamed('/login')}),
                      CustomListTile(Icons.info_outline, 'Order',
                          () => {Navigator.of(context).pushNamed('/login')}),
                      CustomListTile(Icons.help_outline, 'Help',
                          () => {Navigator.of(context).pushNamed('/login')}),
                      CustomListTile(Icons.power_settings_new, 'Log In',
                          () => {Navigator.of(context).pushNamed('/login')})
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Colors.yellow[700],
        onTap: onTap,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}

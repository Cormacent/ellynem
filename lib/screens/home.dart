import 'package:ellynem/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import '../services/authentication.dart';
import '../modal/product.dart';

class Home extends StatefulWidget {
  Home(
      {Key key,
      this.auth,
      this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _userEmail = "";
  String _userName = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    widget.auth.getCurrentUser().then((user){
      setState(() {
        if (user != null){
          _userEmail = user?.email;
          _userName = user?.displayName;
        }
      });
    });
    super.initState();
  }

  List<Product> _jenis = [
    Product(jenis: "brownies"),
    Product(jenis: "molen"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(
        auth: widget.auth,
        logoutCallback: widget.logoutCallback,
        userEmail: _userEmail,
        userName: _userName,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
              child: Container(
                color: Colors.yellow[700],
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.yellow[700],
                          size: 40,
                        ),
                        onPressed: () {
                          (_userEmail != "")
                              ? Navigator.of(context).pushNamed('/cart')
                              : Navigator.of(context).pushNamed('/login');
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  "Ellyne'm",
                  style: TextStyle(
                      fontFamily: 'Yellowtail',
                      fontSize: 80,
                      color: Colors.grey[600]),
                ),
                Text(
                  "B    R    O    W    N    I    E    S",
                  style: TextStyle(
                      fontFamily: 'RamblaBold',
                      fontSize: 20,
                      color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(70, 0, 40, 0),
                  height: 150,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 35,
                        top: 20,
                        right: 20,
                        bottom: 20,
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.5,
                                blurRadius: 10.0,
                                offset: Offset(
                                  5.0, //horizontal
                                  10.0, //vertical
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(50, 25, 0, 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Brownies',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '6 item',
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        bottom: 40,
                        child: Container(
                          width: 70,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.5,
                                blurRadius: 10.0,
                                offset: Offset(
                                  5.0, //horizontal
                                  10.0, //vertical
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset('assets/icons/brownie.png',
                                width: 5, height: 5),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 55,
                        bottom: 55,
                        child: Container(
                          width: 40,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.5,
                                blurRadius: 10.0,
                                offset: Offset(
                                  5.0, //horizontal
                                  10.0, //vertical
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.yellow[700],
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/item',
                                arguments: Product(
                                  jenis: _jenis[0].jenis,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(70, 0, 40, 0),
                  height: 150,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 35,
                        top: 20,
                        right: 20,
                        bottom: 20,
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.5,
                                blurRadius: 10.0,
                                offset: Offset(
                                  5.0, //horizontal
                                  10.0, //vertical
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(50, 25, 0, 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Molen',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '6 item',
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        bottom: 40,
                        child: Container(
                          width: 70,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.5,
                                blurRadius: 10.0,
                                offset: Offset(
                                  5.0, //horizontal
                                  10.0, //vertical
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset('assets/icons/molen.png',
                                width: 5, height: 5),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 55,
                        bottom: 55,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0.5,
                                blurRadius: 10.0,
                                offset: Offset(
                                  5.0, //horizontal
                                  10.0, //vertical
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.yellow[700],
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/item',
                                arguments: Product(
                                  jenis: _jenis[1].jenis,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

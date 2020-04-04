import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ellynem/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../modal/product.dart';

class Item extends StatefulWidget {
  Item({Key key, this.auth, this.userId}) : super(key: key);

  final BaseAuth auth;
  final String userId;
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  var rating = 0.0;
  double _itemNumber = 0;
  String id;
  final db = Firestore.instance;
  String _userEmail = "";
  String _userId = "";
  String namaItem = "";

  @override
  void initState() {
    if (widget.auth != null) {
      widget.auth.getCurrentUser().then((user) {
        setState(() {
          if (user != null) {
            _userEmail = user?.email;
            _userId = user?.uid;
          }
        });
      });
    }
    print(widget.userId);
    super.initState();
  }

  Container buildItem(DocumentSnapshot doc) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(50, 0, 40, 0),
      height: 150,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 50,
            top: 10,
            right: 20,
            bottom: 10,
            child: Container(
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
                padding: EdgeInsets.fromLTRB(45, 15, 35, 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${doc.data['nama']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${doc.data['deskripsi']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SmoothStarRating(
                              rating: double.parse('${doc.data['rating']}'),
                              size: 20,
                              borderColor: Colors.yellow[700],
                              color: Colors.yellow[700],
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border,
                              starCount: 5,
                              allowHalfRating: false,
                              spacing: 2.0,
                              onRatingChanged: (value) {
                                setState(() {
                                  rating = value;
                                });
                              },
                            ),
                            Text(
                              '${doc.data['harga']} K',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            bottom: 30,
            child: Container(
              width: 90,
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
                    Icons.add,
                    color: Colors.yellow[700],
                    size: 25,
                  ),
                  onPressed: () {
                    (_userEmail != "")
                        ? setState(() {
                            namaItem = doc.data['nama'];
                            _itemNumber += 1;
                            sentToCart(_itemNumber, namaItem);
                            print(_itemNumber);
                          })
                        : Navigator.of(context).pushNamed('/login');
                  },
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Product _namaJenis = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
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
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
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
                  height: 180.0,
                ),
                // ListItem(),
                StreamBuilder<QuerySnapshot>(
                  stream: db.collection(_namaJenis.jenis).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data.documents
                            .map((doc) => buildItem(doc))
                            .toList(),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                )
              ],
            ),
            Positioned(
              top: 80,
              left: 30,
              child: Container(
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Text(
                      "Brownies\nMenu",
                      style: TextStyle(
                        fontFamily: 'Yellowtail',
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sentToCart(double itemNumber, namaItem) async {
    await db
        .collection("cart")
        .document(_userId)
        .collection(namaItem)
        .add({'jumlah': itemNumber});
    // await db.collection("cart").document(_userId).setData(
    //   {'name': namaItem, 'jumlah': itemNumber},
    // );
  }
}

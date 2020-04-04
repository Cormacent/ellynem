import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var rating = 0.0;
  double _itemNumber = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.yellow[700],
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Shopping",
                    style: TextStyle(
                        fontFamily: 'Yellowtail',
                        fontSize: 70,
                        color: Colors.grey[600],
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(
                        fontFamily: 'Yellowtail',
                        fontSize: 70,
                        color: Colors.grey[600],
                        decoration: TextDecoration.none),
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
                              padding: EdgeInsets.fromLTRB(50, 25, 35, 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Brownies',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        color: Colors.grey[700]),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SmoothStarRating(
                                        rating: rating,
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
                                        '20 K',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
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
                          top: 25,
                          bottom: 25,
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
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  hoverColor: Colors.yellow[700],
                                  icon: Icon(Icons.add),
                                  iconSize: 20,
                                  tooltip: 'Increase volume by 10',
                                  onPressed: () {
                                    setState(() {
                                      _itemNumber += 1;
                                    });
                                  },
                                ),
                                IconButton(
                                  hoverColor: Colors.yellow[700],
                                  icon: Icon(Icons.minimize),
                                  iconSize: 20,
                                  tooltip: 'Increase volume by 10',
                                  onPressed: () {
                                    setState(() {
                                      _itemNumber -= 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 410),
                child: DraggableScrollableSheet(
                  initialChildSize: 0.4,
                  minChildSize: 0.2,
                  maxChildSize: 0.6,
                  builder: (context, controller) {
                    return SingleChildScrollView(
                      controller: controller,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Order',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.yellow[700],
                                    size: 40,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Number of Item',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '$_itemNumber',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Sub Total',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '20 K',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[800],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '20K',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: RaisedButton(
                                  color: Colors.yellow[700],
                                  elevation: 1.0,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/checkout');
                                  },
                                  child: Text(
                                    'CHECKOUT',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
            child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Container(
                color: Colors.yellow[700],
              ),
            ),
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
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                        fontFamily: 'Yellowtail',
                        fontSize: 70,
                        color: Colors.grey[600],
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Number of Item',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'aaaa',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Pengiriman',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey[600])),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Take Away',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Delivery',
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
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.grey[800],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            alignment: Alignment.center,
                            child: RaisedButton(
                              color: Colors.yellow[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              elevation: 1.0,
                              onPressed: () {
                                SweetAlert.show(context,
                                    subtitle:
                                        "Apakah anda yakin ingin melanjutkan Order ?",
                                    style: SweetAlertStyle.confirm,
                                    showCancelButton: true,
                                    onPress: (bool isConfirm) {
                                  if (isConfirm) {
                                    SweetAlert.show(context,
                                        subtitle: "Ordering...",
                                        style: SweetAlertStyle.loading);
                                    new Future.delayed(new Duration(seconds: 2),
                                        () {
                                      SweetAlert.show(context,
                                          subtitle:
                                              "Success! please wait and see in the order place",
                                          style: SweetAlertStyle.success,
                                          onPress: (bool isConfirm) {
                                        if (isConfirm) {
                                          Navigator.of(context).pushNamed('/');
                                        }
                                        return false;
                                      });
                                    });
                                  } else {
                                    SweetAlert.show(context,
                                        subtitle: "Canceled!",
                                        style: SweetAlertStyle.error);
                                  }
                                  // return false to keep dialog
                                  return false;
                                });
                              },
                              child: Text(
                                'Order Now',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

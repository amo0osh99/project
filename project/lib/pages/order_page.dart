// @dart=2.9
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';





class OrderPage extends StatefulWidget {
    static const id =  '/OrderPage';
    const OrderPage({Key key}) : super(key: key);
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    print('building orders');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        backgroundColor: Colors.yellow[900],
      ),
      
    );
  }
}

// @dart=2.9
import 'package:flutter/material.dart';



class CartPage extends StatefulWidget {
    static const id =  '/CartPage';
    const CartPage ({Key key}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Colors.yellow[900],
      ),
      
    );
  }
}

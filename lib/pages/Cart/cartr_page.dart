import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'cart_bottom_navbar.dart';
import 'cart_item_sampels_.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String x = "knknknknkn";
  final _formkey = GlobalKey<FormFieldState>();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* bottomNavigationBar: CartBottomNavBar(), */
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CartItemSampels(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          key: _formkey,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "is empty";
                            }
                            return null;
                          },
                          maxLines: 3,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.redeem),
                            border: InputBorder.none,
                            hintText: 'Coupon',
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (x == _formkey.currentState!.validate().toString()) {
                        "done";
                      } else {
                        "jkjd";
                      }
                    },
                    child: Text("Apply"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.yellow)))),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Items"),
                            Text("\$600"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping"),
                            Text("\$40"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Import chargess"),
                            Text("\$128"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price"),
                        Text("\$768"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {}
            },
            child: Text("Check Out"),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: Colors.yellow)))),
          ),
        ],
      ),
    );
  }
}


/*decoration: BoxDecor ation(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Add Coupon Code",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ), */
                
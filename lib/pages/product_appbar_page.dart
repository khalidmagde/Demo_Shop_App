import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductAppbarPage extends StatelessWidget {
  const ProductAppbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Product",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Spacer(),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

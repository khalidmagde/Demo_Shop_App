import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NoResultFoundPage extends StatefulWidget {
  const NoResultFoundPage({super.key});

  @override
  State<NoResultFoundPage> createState() => _NoResultFoundPageState();
}

class _NoResultFoundPageState extends State<NoResultFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Result Found",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mega_store_tr/pages/login_page.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  deleteAcc() async {
    CollectionReference delUser =
        await FirebaseFirestore.instance.collection("users");
    FirebaseAuth.instance.currentUser!.delete();
    try {
      delUser.doc('vzoWwlXR12WX2R2aaA2f').delete();
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'images/alert.png',
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text("Are you sure you wanna Delete Account"),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 49, 34),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      deleteAcc();
                    });
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

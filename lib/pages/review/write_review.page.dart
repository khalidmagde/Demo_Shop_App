import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mega_store_tr/pages/review/review_product_page.dart';

class WriteReviewPage extends StatefulWidget {
  const WriteReviewPage({super.key});

  @override
  State<WriteReviewPage> createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage> {
  final TextEditingController _reviewcontroller = TextEditingController();

  addReview() async {
    CollectionReference reviewref =
        await FirebaseFirestore.instance.collection("reviewbyuser");

    reviewref.add({
      'review': _reviewcontroller.text,
      'userid': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Write Review",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
                "Please write Overall level of satisfaction with your shipping / Delivery Servicedata"),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(20),
              child: RatingBar.builder(
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 20,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, _) {
                  return const Icon(
                    Icons.favorite,
                    color: Colors.blue,
                  );
                },
                onRatingUpdate: (index) {},
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Write Your Review",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: _reviewcontroller,
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "write your review here",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                25,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 49, 34),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      addReview();
                    },
                    child: const Text(
                      "Send Review",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
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

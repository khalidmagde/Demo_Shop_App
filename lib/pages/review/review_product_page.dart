import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mega_store_tr/pages/review/write_review.page.dart';

class ReviewProductPage extends StatefulWidget {
  const ReviewProductPage({super.key});

  @override
  State<ReviewProductPage> createState() => _ReviewProductPageState();
}

class _ReviewProductPageState extends State<ReviewProductPage> {
  CollectionReference reviewref =
      FirebaseFirestore.instance.collection("reviewbyuser");
  Widget _showData() {
    return StreamBuilder(
        stream: reviewref
            .where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          }
          if (snapshot.hasData) {
            return Expanded(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, i) {
                      return Text("${snapshot.data.docs[i]['review']}");
                    }),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loding");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _buildCategoryProduct(String image) {
    return Row(
      children: [
        CircleAvatar(
          maxRadius: 48,
          backgroundColor: Colors.transparent,
          child: Image(
            image: AssetImage('images/$image'),
          ),
        ),
        Column(
          children: [
            const Text("James Lawson"),
            const SizedBox(height: 15),
            RatingBar.builder(
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
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Reviews",
          style: TextStyle(color: Colors.black),
        ),
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
          children: <Widget>[
            _buildCategoryProduct('person.png'),
            _showData(),
            _buildCategoryProduct('person.png'),
            _showData(),
            _buildCategoryProduct('person.png'),
            _showData(),
            _buildCategoryProduct('person.png'),
            _showData(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 49, 34),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return WriteReviewPage();
                      }));
                    },
                    child: const Text(
                      "Write Review",
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

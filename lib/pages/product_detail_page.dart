import 'package:clippy_flutter/arc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mega_store_tr/pages/product_appbar_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mega_store_tr/pages/review/review_product_page.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const ProductAppbarPage(),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(
                    'images/applewatch.png',
                    height: 200,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "data",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          addimg();
                        },
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
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
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(13),
                  child: const Text(
                    "\$299,4",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(13),
                  child: const Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "The Nike Air Max 270 React ENG combines\n a full length React foam midsole with a 270 Max Air \n  unit for unrivaled comfort and a striking visual\n experience.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "data",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: const Text("data"),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ReviewProductPage();
                          }));
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
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
                  child: Row(
                    children: [
                      const CircleAvatar(
                        maxRadius: 48,
                        backgroundColor: Colors.transparent,
                        child: Image(
                          image: AssetImage('images/applewatch.png'),
                        ),
                      ),
                      Column(
                        children: [
                          const Text("data"),
                          const SizedBox(height: 15),
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
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
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "The Nike Air Max 270 React ENG combines\n a full length React foam midsole with a 270 Max Air \n  unit for unrivaled comfort and a striking visual\n experience.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  height: 20,
                  //color: Colors.blue,
                  width: double.infinity,
                  child: const Text(
                    "You May Like",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                builderYouMayLike(),
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
                        onTap: () {},
                        child: const Text(
                          "Add To Cart",
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
        ],
      ),
    );
  }
}

Widget _buildCategoryProduct(String image) {
  return Row(
    children: [
      Expanded(
        child: CircleAvatar(
          maxRadius: 48,
          backgroundColor: Colors.transparent,
          child: Image(
            image: AssetImage('images/$image'),
          ),
        ),
      ),
    ],
  );
}

Widget builderYouMayLike() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCard(),
        buildCard(),
        buildCard(),
        buildCard(),
      ],
    ),
  );
}

Widget buildCard() {
  return Column(
    children: [
      Card(
        elevation: 0,
        child: Column(
          children: [
            Container(
              height: 150,
              width: 188,
              color: Colors.white,
              child: Image.asset('images/applewatch.png'),
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          children: [
            const Text("Fs - Nike Air Max 270 \n react"),
            const Text(
              '\$299',
              textAlign: TextAlign.left,
            ),
            IconButton(
              onPressed: () {
                addimg();
              },
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ],
        ),
      ),
    ],
  );
}

var imageUrl =
    'https://firebasestorage.googleapis.com/v0/b/megastore-tr.appspot.com/o/applewatch.png?alt=media&token=72c6b34f-52e9-4f1a-a1fc-394332cf286e';
CollectionReference imgref = FirebaseFirestore.instance.collection("fav");
addimg() async {
  await imgref.add({
    'imageUrl': imageUrl,
    'userid': FirebaseAuth.instance.currentUser!.uid,
  });
}

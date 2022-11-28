import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mega_store_tr/pages/product_detail_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/megastore-tr.appspot.com/o/applewatch.png?alt=media&token=72c6b34f-52e9-4f1a-a1fc-394332cf286e';
  CollectionReference imgref = FirebaseFirestore.instance.collection("fav");
  addimg() async {
    await imgref.add({
      'imageUrl': imageUrl,
      'userid': FirebaseAuth.instance.currentUser!.uid,
    });
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
                child: InkWell(
                  child: Image.asset('images/applewatch.png'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ProductDetailPage();
                      }),
                    );
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  addimg();
                },
                icon: Icon(Icons.favorite_border_outlined),
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
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Categories Nmae",
          style: TextStyle(color: Colors.black),
        ),
        //elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                buildCard(),
                buildCard(),
              ],
            ),
            Row(
              children: [
                buildCard(),
                buildCard(),
              ],
            ),
            Row(
              children: [
                buildCard(),
                buildCard(),
              ],
            ),
            Row(
              children: [
                buildCard(),
                buildCard(),
              ],
            ),
            Row(
              children: [
                buildCard(),
                buildCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

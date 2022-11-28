import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_store_tr/pages/Fav_page.dart';
import 'package:mega_store_tr/pages/all_categories_page.dart';

class TapToFavPage extends StatefulWidget {
  TapToFavPage({Key? key}) : super(key: key);

  @override
  State<TapToFavPage> createState() => _TapToFavPageState();
}

class _TapToFavPageState extends State<TapToFavPage> {
  var imageUrl = 'images/applewatch.png';
  CollectionReference imgref = FirebaseFirestore.instance.collection("fav");
  addimg() async {
    await imgref.add({
      'imageUrl': imageUrl,
      'userid': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  Widget _buildCategoryProduct(String image) {
    return Column(
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
        const Text("data"),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  int? _currentIndex;
  List imgList = [
    'images/slider.png',
    'images/slider.png',
    'images/slider.png',
  ];
  Container buildContainer(index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index
            ? Colors.grey
            : const Color.fromARGB(47, 158, 158, 158),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _key,
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),

        // menu
        leading: PopupMenuButton(
          onSelected: (value) {},
          icon: Icon(Icons.movie_sharp),
          itemBuilder: (_) {
            return [
              PopupMenuItem(
                child: Text('filter by fav'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('filter by fav'),
                value: 1,
              )
            ];
          },
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (BuildContext context, int index, _) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        imgList[index],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 130,
                    initialPage: 0,
                    autoPlay: true,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildContainer(0),
                    buildContainer(1),
                    buildContainer(2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        child: const Text(
                          "See All ->",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const AllCategories();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      _buildCategoryProduct('applewatch.png'),
                      _buildCategoryProduct('applewatch.png'),
                      _buildCategoryProduct('applewatch.png'),
                      _buildCategoryProduct('applewatch.png'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 144,
                  width: double.infinity,
                  //color: Colors.blue,
                  child: const Image(
                    image: AssetImage('images/watch.png'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  height: 20,
                  //color: Colors.blue,
                  width: double.infinity,
                  child: const Text(
                    "Flash Sale",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCard(),
                      buildCard(),
                      buildCard(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                Column(
                  children: [
                    builderYouMayLike(),
                    builderYouMayLike(),
                    builderYouMayLike(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget builderYouMayLike() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCard(),
        buildCard(),
      ],
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
                icon: Icon(Icons.favorite_border_outlined),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/* Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signed in as  " + user.email!),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepPurple,
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    ); */
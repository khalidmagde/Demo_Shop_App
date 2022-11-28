import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  CollectionReference favref = FirebaseFirestore.instance.collection('fav');
  Future<void> getImages() async {
    ListResult ref = await FirebaseStorage.instance.ref().listAll();
    ref.items.forEach((element) {
      print("++++++++++++++++++++++++");
      print('$element');
    });
  }

  @override
  void initState() {
    getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite List",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: StreamBuilder(
            stream: favref
                .where("userid",
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Error');
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, i) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) async {
                          await favref.doc(snapshot.data!.docs[i].id).delete();
                          await FirebaseStorage.instance
                              .refFromURL(snapshot.data.docs[i]['imageUrl'])
                              .delete();
                        },
                        child: Image.network(
                          snapshot.data!.docs[i]['imageUrl'],
                          height: 200,
                        ),
                      );

/**/
                      //return Text("${snapshot.data.docs[i]['imageUrl']}");
                    });
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loding");
              }
              return Text("l");
            }),
      ),
    );
  }
}

 /* FutureBuilder(
            future: favref
                .where('userid',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, i) {
                      return Text("${snapshot.data.docs[i].data()['userid']}");
                    });
              }
            }), */
            
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mega_store_tr/pages/address/add_adress_page.dart';
import 'package:mega_store_tr/profile/delete_account_screen.dart';
import 'package:mega_store_tr/profile/update_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CollectionReference userref = FirebaseFirestore.instance.collection("users");
  Widget _showData() {
    return StreamBuilder(
        stream: userref.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          }
          if (snapshot.hasData) {
            return SizedBox(
              height: 20,
              child: ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, i) {
                    return Text("${snapshot.data.docs[i]['email']}");
                  }),
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

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text("profile"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(100),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage('images/person.png'),
                  ),
                ),
              ),
              Text(
                "Dominic Ove",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Container(child: _showData()),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    side: BorderSide.none,
                    shape: StadiumBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 30,
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.calendar,
                onPress: () {},
                title: 'My Orders',
              ),
              ProfileMenuWidget(
                icon: Icons.location_on_outlined,
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return AddAddressPage();
                    }),
                  );
                },
                title: 'Adresss',
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.user_check,
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return UpdateProfileScreen();
                    }),
                  );
                },
                title: 'Profile',
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.info,
                onPress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (builder) {
                    return DeleteAccountScreen();
                  }));
                },
                title: 'Delete Account',
              ),
              ProfileMenuWidget(
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {
                  FirebaseAuth.instance.signOut();
                },
                title: 'Logout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.amber.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(title),
      trailing: endIcon
          ? Container(
              // width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                LineAwesomeIcons.angle_right,
                size: 18.0,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}

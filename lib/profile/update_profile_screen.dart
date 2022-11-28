import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mega_store_tr/auth/change_password.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String SelectedLanguage = "English";
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  TextEditingController _langcontroller = TextEditingController();
  TextEditingController _fullnamecontroller = TextEditingController();
  _updateName() async {
    CollectionReference nameref =
        await FirebaseFirestore.instance.collection("users");
    nameref.doc('VurvEufAXm98S7QCix1h').update({
      'full name': _fullnamecontroller.text,
    });
  }

  _updateNumber() async {
    CollectionReference nameref =
        FirebaseFirestore.instance.collection("users");
    nameref.doc('VurvEufAXm98S7QCix1h').update({
      'phone number': _phonecontroller.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            LineAwesomeIcons.angle_double_left,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage('images/person.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  children: [
                    //full name
                    builderTtextForm(_fullnamecontroller, "Full Name :  ",
                        Icons.person_2_rounded, () {
                      _bottomSheet(context, _updateName, _fullnamecontroller,
                          "Full Name", Icons.person_add_alt_rounded);
                    }),
                    // email
                    builderTtextForm(
                        _emailcontroller, "Email :  ", Icons.email_outlined,
                        () {
                      _bottomSheet(context, () {}, _emailcontroller,
                          "Change Email", Icons.email_rounded);
                    }),
                    //phone number
                    builderTtextForm(_phonecontroller, "Phone Number :  ",
                        Icons.phone_android_sharp, () {
                      _bottomSheet(context, _updateNumber, _phonecontroller,
                          "Phone Number", Icons.phone_android_sharp);
                    }),
                    //password
                    builderTtextPasswordForm(
                      _passcontroller,
                      "change password :  ",
                      Icons.lock,
                    ),
                    Container(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          const Icon(Icons.language_rounded),
                          const SizedBox(
                            width: 25,
                          ),
                          InkWell(
                            child: const Text(
                              "Change Lang",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext c) {
                                    return Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.all(20),
                                          child: Text(
                                            "Select Language",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          child: DropdownButton(
                                            items: ["English", "Arabic"]
                                                .map(
                                                  (e) => DropdownMenuItem(
                                                    child: Text("$e"),
                                                    value: e,
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                SelectedLanguage =
                                                    val.toString();
                                              });
                                            },
                                            value: SelectedLanguage,
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _bottomSheet(context, VoidCallback onsave, TextEditingController controller,
      String bottomsheetText, IconData iconData) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: Text(
                  bottomsheetText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(iconData),
                      border: InputBorder.none,
                      hintText: bottomsheetText,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 49, 34),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: onsave,
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  TextField builderTtextForm(
    TextEditingController controller,
    String prefxtext,
    IconData iconData,
    VoidCallback onpress,
  ) {
    return TextField(
      onTap: onpress,
      decoration: InputDecoration(
        prefixText: prefxtext,
        suffixIcon: const Icon(LineAwesomeIcons.angle_right),
        border: InputBorder.none,
        prefixIcon: Icon(iconData),
      ),
      controller: controller,
    );
  }

  TextField builderTtextPasswordForm(
    TextEditingController controller,
    String prefxtext,
    IconData iconData,
  ) {
    return TextField(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return ChangePasswordPage();
          }),
        );
      },
      decoration: InputDecoration(
        prefixText: prefxtext,
        suffixIcon: const Icon(LineAwesomeIcons.angle_right),
        border: InputBorder.none,
        prefixIcon: Icon(iconData),
      ),
      obscureText: true,
      controller: controller,
    );
  }
}

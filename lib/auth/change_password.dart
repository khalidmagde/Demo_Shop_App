import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mega_store_tr/pages/login_page.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  final _formkey = GlobalKey<FormState>();
  var newPassword = "";
  final _newPasswordconteoller = TextEditingController();
  @override
  void dispose() {
    _newPasswordconteoller.dispose();
    super.dispose();
  }

  final currentuser = FirebaseAuth.instance.currentUser!;
  changePassword() async {
    try {
      await currentuser.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        content: Text("Yor Password has been changed.... Login Again"),
      ));
    } catch (e) {}
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        key: _formkey,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: ListView(
          children: [
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset('images/Mega.png'),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("new passsword"),
                  hintText: "Entere New Password",
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.black, fontSize: 15),
                ),
                controller: _newPasswordconteoller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please  enter password";
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      newPassword = _newPasswordconteoller.text;
                    });
                    changePassword();
                  }
                },
                child: Text(
                  "Change Password",
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}

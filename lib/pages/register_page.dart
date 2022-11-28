import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // textcontroller
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();
  TextEditingController _fullnamecontroller = TextEditingController();
  TextEditingController _phonenumbercontroller = TextEditingController();

  Future signUp() async {
    // authenticate user
    if (passwordComfirmed()) {
      // creatte user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
      );
      // add user details
      addUserDetails(_fullnamecontroller.text, _phonenumbercontroller.text,
          _emailcontroller.text);
    }
  }

  Future addUserDetails(
      String fullname, String phonenumber, String email) async {
    await FirebaseFirestore.instance.collection('users').add(
        {'full name': fullname, 'phone number': phonenumber, 'email': email});
  }

  bool passwordComfirmed() {
    if (_passwordcontroller.text == _confirmpasswordcontroller.text) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/Mega.png'),
                const SizedBox(
                  height: 10,
                ),
                //Hello agin!
                const Text(
                  'Lets Get Started',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // sign in button
                const Text(
                  "Create an new account",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // full name textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _fullnamecontroller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full name',
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _phonenumbercontroller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone number',
                          icon: Icon(Icons.phone),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _emailcontroller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                  ),
                ),
                //_errorMessage(),
                const SizedBox(
                  height: 10,
                ),
                //password textfielld
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _passwordcontroller,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            icon: const Icon(Icons.lock)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // confirm password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: _confirmpasswordcontroller,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                            icon: const Icon(Icons.lock)),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Signup Button
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
                        onTap: signUp,
                        child: const Text(
                          "Sign Up",
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
                const SizedBox(
                  height: 10,
                ),
                // google sign in

                const SizedBox(
                  height: 5,
                ),

                // not a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('have a account ? '),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        "Sign in ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

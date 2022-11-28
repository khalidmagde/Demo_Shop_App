import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mega_store_tr/pages/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? showRegisterPage;
  const LoginPage({Key? key, this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  // textcontroller
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'oops ? $errorMessage');
  }

  /* @override
  void initState() {
    super.initState();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  } */

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
                  'Welcome to Mega',
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
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                _errorMessage(),
                // Signin Button
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
                        onTap: signIn,
                        child: const Text(
                          "Sign in",
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
                Text('OR'),
                SizedBox(
                  height: 20,
                ),
                // google sign in
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          UserCredential cred = await signInWithGoogle();
                          print(cred);
                        },
                        child: const Text(
                          "Login with Google",
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
                SizedBox(
                  height: 10,
                ),
                // login with facebook
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          UserCredential credential =
                              await signInWithFacebook();
                          print(credential);
                        },
                        child: const Text(
                          "Login with Facebook",
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
                SizedBox(
                  height: 5,
                ),
                // forgot password
                InkWell(
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ForgotPasswordPage();
                      }),
                    );
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                // not a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member ? '),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        "Rigester Now ",
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

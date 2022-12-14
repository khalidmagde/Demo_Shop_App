import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mega_store_tr/auth/auth_page.dart';
import 'package:mega_store_tr/pages/home_page.dart';
import 'package:mega_store_tr/pages/login_page.dart';
import 'package:mega_store_tr/pages/navigationbar.dart';
import 'package:mega_store_tr/pages/verify_email_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavigationBarPage();
            //HomePage();
            //VerifyEmailPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}

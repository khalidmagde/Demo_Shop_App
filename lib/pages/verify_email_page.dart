/* import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mega_store_tr/pages/home_page.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  var timer;
  bool isEmailVerified = false;
  bool canResendEmail = false;
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) {
          checkEmailVerifird();
        },
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerifird() async {
    //call after email verefication!
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail= true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? const HomePage()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Verify Email'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "A verfication email has been sent to your email",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    onPressed: canResendEmail? sendVerificationEmail,
                    icon: Icon(
                      Icons.email,
                      size: 32,
                    ),
                    label: Text(
                      'Resent Email',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      
                    ),
                    
                  ),
                  SizedBox(height: 8,),
                  TextButton( style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50),),onPressed: (){
                    FirebaseAuth.instance.
                  } , child: Text("cancel" , style: TextStyle(fontSize: 24),),),
                ],
              ),
            ),
          );
  }
}
 */